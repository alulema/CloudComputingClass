use admin;
db.createUser( {
     user: "siteUserAdmin",
     pwd: "password",
     roles: [ { role: "userAdminAnyDatabase", db: "admin" } ],
     mechanisms:[
      "SCRAM-SHA-1"
     ]
   });
db.createUser( {
    user: "siteRootAdmin",
    pwd: "password",
    roles: [ { role: "root", db: "admin" } ],
    mechanisms:[
     "SCRAM-SHA-1"
    ]
});
