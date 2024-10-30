
**********************************************
&& Save log file *****************************
PROCEDURE saveLog(logMessage as Character, pathToLog as Character, deleteOn as Boolean)
* if parameters are empty
  * Set default value
  IF EMPTY(deleteOn)
    deleteOn = .F.
  ENDIF
  * Path to Log directory
  IF EMPTY(pathToLog)    
    logDir = "Log" 
  ELSE 
    IF isRegExpPatternFound(pathToLog, "^\.(?:\.{2})?(?:\/\.{2})*(\/[a-zA-Z0-9]+)+$")  
      logdir = pathToLog +"/"+"Log"
    ELSE
      logDir = "Log"
    ENDIF  
  ENDIF
  
* Log name generation 
    * based on current date if every day log file creation 
    * LogName = 'Tracelog_'+ DTOS(DATETIME()) + '.log' 
    logName = 'Tracelog.log'
  
* find directory /Log if not create
  isDir = ADIR(aDirect, logDir, "D")
  IF isDir = 0
    * Create direcory /LOG if not exists
    MD (logDir)
  ENDIF
* Clear directory /LOG if needed
  IF (deleteOn=.T.)
   DELETE FILE (logDir+"/"+logName)
  ENDIF  
* save log message
  * convert current date to string 
  *nDaysfromZlt = STR(DTOT(DATE())-DATETIME(1970, 1, 1, 0, 0, 0))
   
  IF EMPTY(logMessage)
    RETURN
  ELSE 
    STRTOFILE(TTOC(DATETIME()) + ":" + logMessage + CHR(13) + CHR(10), ;
                                       logDir+"/"+logName, not deleteOn)  
                                        *"LOG/LOG_" + STRTRAN(STRTRAN(STRTRAN(TTOC(DATETIME()),'.','_'),':','_'),' ','_') + ".log", not deleteOn)
    RETURN   
 ENDPROC                 
 
 *****************************************************
 * CLEAR old log files (move to archive or remove) ***
     * operation type - D or C 
     * D - delete by Date - remove all log files which were created till logCreatedDate
     * C - move to archiveDirectory
 PROCEDURE deleteLog(operationType, logCreatedDate, archiveDirectoryPath)
 * if parameters are empty
  IF EMPTY(operationType)
    RETURN 
  ENDIF
  * If logCreatedDate is Epmpty - delete all log files in Log/ folder
  * If archiveDirectoryPath is Epmpty - log files will be move to Log/Archive/ directory 
  MESSAGEBOX('Del')
    RETURN
 ENDPROC  
 
 ******************************************************
 * REGEXP IN VFP **************************************
 FUNCTION isRegExpPatternFound(strInput as Character, regExpPattern as Character)
 
   IF EMPTY(strInput) OR EMPTY(regExpPattern)
    RETURN .T.
   ENDIF
   oRE = CreateObject("VBScript.RegExp")
   oRE.Pattern = regExpPattern &&"^(?:\.{2})?(?:\/\.{2})*(\/[a-zA-Z0-9]+)+$"
   lcString = strInput
   llResult = oRE.test(lcString)
 
  RETURN llResult
  
ENDFUNC  

                

