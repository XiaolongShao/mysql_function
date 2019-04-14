delimiter &&
CREATE FUNCTION getParentList(rootId INT)
RETURNS varchar(1000)
BEGIN
DECLARE sTemp VARCHAR(1000);
DECLARE sTempPar VARCHAR(1000);
SET sTemp ='';
SET sTempPar =rootId;
WHILE sTempPar is not null DO
IF sTemp !='' THEN
SET sTemp =concat(sTemp,',',sTempPar);
ELSE
SET sTemp = sTempPar;
END IF;
SET sTemp =concat(sTemp,',',sTempPar);
SELECT group_concat(pid) INTO sTempPar FROM province where pid<>id and FIND_IN_SET(id,sTempPar)>0;
END WHILE;
RETURN sTemp;
END &&
