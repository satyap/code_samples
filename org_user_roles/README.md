The Organizations - Users - Roles Kata
======================================

http://www.adomokos.com/2012/10/the-organizations-users-roles-kata.html



Text of the problem statement
-----------------------------

(See the link above)

 We have three layers of organizations: root organization, organizations and child organizations.
There is only one root organization that we call "Root Org".
Organizations have one parent.
The parent of all organizations is the Root Org.
The organizations can have any number of child organizations, but the child orgs do not have children of their own (they are leaves).

There are three different roles in the system:

    Admin
    User
    Denied

Roles are inherited through the organization hierarchy: an admin to an organization is an admin to all of its child organizations as well. For example - using the organization structure in the diagram above - if I have admin role access to Org 1, than I should have admin access to Child Org 1 and Child Org 2.

If a role is specified to a child org for a given user, that role takes precedence over the inherited role from the organization level.
When I have the "denied" role for Child Org 2, than I only have admin access to Org 1 and Child Org 1 and I don't even see Child Org 2. 

Please consider writing code for the logic described above using tests to verify your logic. Simulate the data access code and try to keep the number of queries to a minimum. 


Testing
-------

Run rake:

    rake

To see the SQL statements, run with DEBUG:

    DEBUG=1 rake


Notes
-----

The way that the recursive role lookup works, it can work to org trees of any depth.

I used ActiveRecord and its relation methods, so it was easy to do. The tests are actually harder to understand. I should refactor them a bit.
