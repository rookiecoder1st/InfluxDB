package http

import (
	"github.com/influxdb/influxdb/common"
	"github.com/influxdb/influxdb/cluster"
)

type UserManager interface {
	// Returns the user for the given db and that has the given
	// credentials, falling back to cluster admins
	AuthenticateDbUser(db, username, password string) (common.User, error)
	// Returns the cluster admin with the given credentials
	AuthenticateClusterAdmin(username, password string) (common.User, error)
	// Create a cluster admin user, it's an error if requester isn't a cluster admin
	CreateClusterAdminUser(request common.User, username, password string) error
	// Delete a cluster admin. Same restrictions as CreateClusterAdminUser
	DeleteClusterAdminUser(requester common.User, username string) error
	// Change cluster admin's password. It's an error if requester isn't a cluster admin
	ChangeClusterAdminPassword(requester common.User, username, password string) error
	// List cluster admins. Only a cluster admin can list the other cluster admins
	ListClusterAdmins(requester common.User) ([]string, error)
	// Create a db user, it's an error if requester isn't a db admin or cluster admin
	CreateDbUser(request common.User, db, username, password string, permissions ...string) error
	// Delete a db user. Same restrictions apply as in CreateDbUser
	DeleteDbUser(requester common.User, db, username string) error
	// Change db user's password. It's an error if requester isn't a cluster admin or db admin
	ChangeDbUserPassword(requester common.User, db, username, password string) error
	ChangeDbUserPermissions(requester common.User, db, username, readPermissions, writePermissions string) error
	// list cluster admins. only a cluster admin or the db admin can list the db users
	ListDbUsers(requester common.User, db string) ([]common.User, error)
	GetDbUser(requester common.User, db, username string) (common.User, error)
	// make user a db admin for 'db'. It's an error if the requester
	// isn't a db admin or cluster admin or if user isn't a db user
	// for the given db
	SetDbAdmin(requester common.User, db, username string, isAdmin bool) error
    // Save a user's subscription
//    SubscribeTimeSeries(db, username string, id int, duration int, start, end int64, isDeleted bool) error
    SubscribeTimeSeries(db, username, kw string, duration int, start, end int64, isDeleted bool) error
    // List the subscriptions currently available
    ListSubscriptions(requester common.User, db string) ([]*cluster.Subscription, error)
    // Delete subscriptions with id's from given list
//    DeleteSubscriptions(db, username string, id int) error
    DeleteSubscriptions(db, username, kw string) error
}
