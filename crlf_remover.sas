/*  Clean up .CSV file to remove CR LF that creates phantom
    records during data imports using REDCap API.
    The following code was adapted from here:
    http://support.sas.com/kb/26/065.html                     */

/************************** CAUTION ***************************/
/*                                                            */
/* This program UPDATES IN PLACE, create a backup copy of the */
/* data before running.                                       */
/*                                                            */
/************************** CAUTION ***************************/

/* Replace carriage return and linefeed characters inside     */
/* double quotes with a specified character.  This sample     */
/* uses '@' and '$', but any character can be used, including */
/* spaces.  CR/LFs not in double quotes will not be replaced. */


%let repA='@';                    /* replacement character LF */
%let repD='$';                    /* replacement character CR */


%let dsnnme=[REPLACE THIS WITH YOUR CSV FILENAME OR MACRO]; 
/* use full path of CSV file */

data _null_;
  /* RECFM=N reads the file in binary format. The file consists    */
  /* of a stream of bytes with no record boundaries.  SHAREBUFFERS */
  /* specifies that the FILE statement and the INFILE statement    */
  /* share the same buffer.                                        */
  infile &dsnnme recfm=n sharebuffers;
  file &dsnnme recfm=n;

  /* OPEN is a flag variable used to determine if the CR/LF is within */
  /* double quotes or not.  Retain this value.                        */
  retain open 0;

  input a $char1.;
  /* If the character is a double quote, set OPEN to its opposite value. */
  if a = '"' then open = ^(open);

  /* If the CR or LF is after an open double quote, replace the byte with */
  /* the appropriate value.                                               */
  if open then do;
    if a = '0D'x then put &repD;
    else if a = '0A'x then put &repA;
  end;
run;
