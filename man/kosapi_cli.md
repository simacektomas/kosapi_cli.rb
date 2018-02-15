KOSAPI\_CLI 1 "FEBUARY 2018" Linux "User Manuals"
=================================================

NAME
----

kosapi\_cli - commandline interface for KOSapi

SYNOPSIS
--------

`kosapi_cli` help [command]  
`kosapi_cli` `user` login [-u|--username] [-p|--password] 
                logout  
`kosapi_cli` `resource` branches [find|study\_plans] [`-f`] [`-l`] [`-o`] [`-r`]    
                    course\_events [find|attendees] [`-f`] [`-l`] [`-o`] [`-r`]  
                    courses [find] [`-d`] [`-f`] [`-l`] [`-o`] [`-r`] [`-s`]  
                    divisions [find|courses|subdivisions|teachers] [`-f`] [`-l`] [`-o`] [`-r`]  
                    exams [find|attendees] [`-f`] [`-l`] [`-o`] [`-r`]  
                    parallels [find|related|students] [`-f`] [`-l`] [`-o`] [`-r`]
                    teachers [find|courses|parallels|exams|timetable] [`-f`] [`-l`] [`-o`] [`-r`] [`-s`]

DESCRIPTION
-----------

Simple commandline utility for querrying KOSapi REST interface. You need to have
your KOSapi credentials to be able to use it (https://auth.fit.cvut.cz/manager).
Then you need to create your access token by using \``kosapi_cli` user login\` command.
Afterwards you should be able to querry implemented KOSapi resources.

OPTIONS
-------
`-d|--detail`
  Numeric value that specify the level of response detail.

`-f|--format`  
  Determines the output format of KOSapi response. Possible values are  
  json.    

`-l|--limit`  
  Numeric value that limits number of entities in KOSapi response.

`-o|--offset`  
  Numeric value that determines the frist entity in the KOSapi response.

`-p|--password`  
  Specify KOSapi client secret. If ommited the command will ask for it.

`-r|--query`
  RSQL expression that can be used to more detailed querry.

`-s|--sem`
  Code of the semester|semesters that should be searched.

`-u|--user`  
  Specify KOSapi client id. If ommited the command will ask for it.

`-x|--fields`
  XPartial expression that can filter specified collumns only.

FILES
-----

*~/.kosapi_cli*
  Per user configuration file. It stores access token for KOSapi.

RETURN CODES
------------

`0` - No error  

`1` - Bad credentials  
  You have entered bad KOSapi credentials.

`2` - No access token
  No acess token founded in *~/.kosapi_cli*. Run \``kosapi_cli` user login\`.

`3` - KOSapi error
  KOSapi exception raised. Invalid value of paramteres ...

AUTHOR
------

Tomas Simacek <simacektomas@volny.cz>

CONTRIBUTING
------------

Bug reports and pull requests are welcome on GitHub at `https://github.com/simactom/kosapi_cli`.

LICENSE
-------

The gem is available as open source under the terms of the MIT License
