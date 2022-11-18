# ucontrol-genesis-tag-service

    #In another window, after startup:

    #create system default databases
    # $ curl localhost:5984
    # {"couchdb":"Welcome","version":"2.1.1","features":["scheduler"],"vendor":{"name":"The Apache Software Foundation"}}
    # $ curl -X PUT http://admin:password@localhost:5984/_users
    # {"ok":true}
    # $ curl -X PUT http://admin:password@localhost:5984/_replicator
    # {"ok":true}
    # $ curl -X PUT http://admin:password@localhost:5984/_global_changes
    # {"ok":true}

    #enable per_user configuration
    # curl -X PUT localhost:5984/_node/_local/_config/couch_peruser/enable -d "\"true\""
    # curl -X PUT localhost:5984/_node/_local/_config/couch_peruser/delete_dbs -d "\"true\""

    #from 0.0.0.0:5984/_utils gui, login
    #DELETE global_changes db (not needed, requires extra resources)
    #CREATE vfdctl_settings (no partition)