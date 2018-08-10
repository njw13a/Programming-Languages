director(chad).

administrator(edmond).
administrator(burt).
administrator(teresa).

adminPrivilege(User):- director(User).

coach(cordell,tigers).
coach(wade,flamingos).

subscriber(eric).
subscriber(kathryn).
subscriber(mitch).
subscriber(cordell).

adminPrivilege(User):- administrator(User).
adminPrivilege(User):- director(User).

canUpdate(User,_Team):- adminPrivilege(User).
canUpdate(User,Team):- coach(User,Team).

canRead(User,Team)  :- coach(User,Team).
canRead(User,_Teampage)	:- adminPrivilege(User).
canRead(User,_Teampage)	:- subscriber(User).

%canUpdate(User,tigers).
%canRead(User,tigers).