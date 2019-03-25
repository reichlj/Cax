noteset()

n1 = noteset()
n2 = noteset('name','Huber','semester',1,'tm1',1.3)
n3 = noteset(n2,'tm2',1.0)

n4 = noteset('name','Huber','semester',1)
n5 = noteset('tm2',1.0,'sem',3)
n6 = noteset(n4,n5,'tm3',1.3)

% erzeuge Fehler
%e1 = noteset('name','Huber','semester',1,'tm',1.3)
%e2 = noteset('name','Huber','semester',1,'tm4',1.3)
%e3 = noteset('name','Huber','semester',1,'tm1')