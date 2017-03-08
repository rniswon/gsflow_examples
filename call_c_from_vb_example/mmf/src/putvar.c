/**************************************************************************
 * putvar.c: gets the value associated with a module and name, and copies
 * it into the variable provided by the calling routine.
 *
 * There are 2 functions: putvar() to be called from C
 *                        putvar_() to be called from Fortran
 *
 * Returns 0 if successful, 1 otherwise.
 *
 * $Id: putvar.c 5702 2010-07-28 20:42:46Z rsregan $
 *
   $Revision: 5702 $
        $Log: putvar.c,v $
        Revision 1.7  1996/02/19 20:00:38  markstro
        Now lints pretty clean

        Revision 1.6  1995/05/25 14:26:34  markstro
        (1) Added batch mode
        (2) Replaced "b" functions with "mem" versions

 * Revision 1.5  1994/11/22  17:20:07  markstro
 * (1) Cleaned up dimensions and parameters.
 * (2) Some changes due to use of malloc_dbg.
 *
 * Revision 1.4  1994/09/30  14:54:52  markstro
 * Initial work on function prototypes.
 *
 * Revision 1.3  1994/08/01  16:35:58  markstro
 * Took module name out of key
 *
 * Revision 1.2  1994/01/31  20:17:09  markstro
 * Make sure that all source files have CVS log.
 *
 **************************************************************************/
#define PUTVAR_C
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "mms.h"
/*
 **	OBJECTCENTER: Memory fault
 **		problem:  char *type was passed as a parameter to getparam
 **					realloced, and then freed in the calling procedure.
 **					for this action, the pointer of type must be passed.
 **		solution: change putvar to use local integer variable to avoid realloc
 */

/*--------------------------------------------------------------------*\
 | FUNCTION     : putvar_
 | COMMENT		: called from Fortran, sorts out args and calls putvar()
 | PARAMETERS   :
 | RETURN VALUE : 
 | RESTRICTIONS :
\*--------------------------------------------------------------------*/
long putvar_ (char *mname, char *vname, ftnint *vmaxsize, char *vtype, double *value, 
	     ftnlen mnamelen, ftnlen vnamelen, ftnlen vtypelen) {

//  char *module, *name, *type;
  char module[80], name[80], type[80];
  long maxsize, retval;

  /*
   * copy size to local long int
   */

  maxsize = *vmaxsize;

  /*
   * copy args to new strings, and terminate
   */

//  module = (char *) umalloc(mnamelen + 1);
//  strncpy(module, mname, mnamelen);
//  module[mnamelen] = '\0';

//  name = (char *) umalloc(vnamelen + 1);
//  strncpy(name, vname, vnamelen);
//  name[vnamelen] = '\0';

//  type = (char *) umalloc(vtypelen + 1);
//  strncpy(type, vtype, vtypelen);
//  type[vtypelen] = '\0';

    strncpy (module, mname, mnamelen);
    *(module + mnamelen) = '\0';

    strncpy (name, vname, vnamelen);
    *(name + vnamelen) = '\0';

    strncpy (type, vtype, vtypelen);
    *(type + vtypelen) = '\0';


  /*
   * call C version of putvar()
   */

  retval =  putvar(module, name, maxsize, type, value);

  /*
   * ufree up arrays
   */

//ufree(module);
//ufree(name);
//ufree(type);
  return retval;

}

/*--------------------------------------------------------------------*\
 | FUNCTION     : putvar
 | COMMENT		: called from C
 | PARAMETERS   :
 | RETURN VALUE : 
 | RESTRICTIONS :
\*--------------------------------------------------------------------*/
long putvar (char *module, char *name, long maxsize, char *type, double *value) {
  int var_type;
  PUBVAR *var;
//  char *vkey;
    char vkey[128];
  long i;
  long n1, n2;
  char *ptr1;
  char *ptr2;


  /*
   * compute the key
   */

/*
  vkey = (char *) umalloc(strlen(module) + strlen(name) + 2);
  (void)strcpy(vkey, module);
  strcat(strcat(vkey, "."), name);
*/
//  vkey = strdup (name);
   strncpy (vkey, name, 128);

  /*
   * convert fortran types to C types
   */
  var_type = M_LONG;
  if (!strcmp(type, "real") || !strcmp(type, "float"))
    var_type = M_FLOAT;
  else if (!strcmp(type, "double precision") || !strcmp(type, "double"))
    var_type = M_DOUBLE;

  /*
   * check that type is possible
   */
  if((var_type != M_LONG) && (var_type != M_FLOAT) && (var_type != M_DOUBLE))
    {
      (void)fprintf(stderr,
	      "ERROR - putvar - type %s is illegal.\n", type);
      (void)fprintf(stderr, "Key is '%s'.\n", vkey);
      (void)fprintf(stderr, "Type is '%s'.\n", type);
      return(1);
    }
  
  /*
   * get pointer to variable with key
   */
  
  var = var_addr(vkey);

  if (var == NULL) {
    (void)fprintf(stderr, 
	    "ERROR - putvar - variable not found.\n");
    (void)fprintf(stderr, "Key:   '%s'\n", vkey);
    return(1);
  }
  
  /*
   * check that there is enough space allocated in the calling routine
   * to accommodate the data
   */
  
  if (var->size > maxsize) {
    (void)fprintf(stderr, 
	    "ERROR - putvar - insufficient space for data transfer.\n");
    (void)fprintf(stderr, "Key:   '%s'\n", vkey);
    (void)fprintf(stderr, "Actual size in data base: %ld\n", var->size);
    (void)fprintf(stderr, "Available space in calling routine: %ld\n", maxsize);
    return(1);
  }
  /*
    if (strcmp(Mtypes[var->type], type)) {
    (void)fprintf(stderr, 
    "ERROR - putvar - incorrect data type requested.\n");
    (void)fprintf(stderr, "Key:   '%s'\n", vkey);
    (void)fprintf(stderr, "Requested type: %s\n", type);
    (void)fprintf(stderr, "Actual type in data base: %s\n", Mtypes[var->type]);
    return(1);
    }
    */
  
  /*
   * copy the variable across
   */
  
  if (var->ndimen == 1) {
    switch (var->type) {
      
    case M_LONG:
      memcpy ((char *) var->value, (char *) value, var->size * sizeof(long));
      break;
      
    case M_FLOAT:
      memcpy ((char *) var->value, (char *) value, var->size * sizeof(float));
      break;
      
    case M_DOUBLE:
      memcpy ((char *) var->value, (char *) value, var->size * sizeof(double));
      break;
      
    }
  }
  else
    if (var->ndimen ==2) {
      n1 = var->dimen[0]->max;
      n2 = var->dimen[1]->value;
/*rsr added next block*/
      if (n1*n2 > maxsize ) {
                n1 = var->dimen[0]->value;
      }
/*rsr end block*/

      ptr1 = (char *)value;
      ptr2 = var->value;
      
      for (i = 0; i < n2; i++)
	{
	  
	  switch (var->type) {
	    
	  case M_LONG:
	    memcpy ((char *) ptr2, (char *) ptr1, n1 * sizeof(long));
	    ptr1 += n1 * sizeof(long);
	    ptr2 += n1 * sizeof(long);
	    break;
	    
	  case M_FLOAT:
	    memcpy ((char *) ptr2, (char *) ptr1, n1 * sizeof(float));
	    ptr1 += n1 * sizeof(float);
	    ptr2 += n1 * sizeof(float);
	    break;
	    
	  case M_DOUBLE:
	    memcpy ((char *) ptr2, (char *) ptr1, n1 * sizeof(double));
	    ptr1 += n1 * sizeof(double);
	    ptr2 += n1 * sizeof(double);
	    break;
	  }
	}
    }
  /*
   * free up arrays
   */
//ufree(vkey);
  
  return(0);
  
}
  
