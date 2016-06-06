###########################################################################
#                                                                         #
#                   VeriFone OS SQA Test Suite Makefile                   #
#                   -----------------------------------                   #
#                                                                         #
#  Modification History:                                                  #
#    Date        Programmer        Description                            #
#    --------    ---------------   ---------------------------------      #
#    03/15/2011  Ryan_P1           Initial revision.                      #
#                                                                         #
###########################################################################
#CFLAGS += %ARM40_OPTION%
#LFLAGS += %ARM40_OPTION%

CC= vrxcc
CFLAGS += -vv -p
LFLAGS += -c -p -vv 
COMMON = \TestSuite10\Common
NETSDKLIB = \TestSuite10\EOSSDK\lib\svc_net.o 
EOSSDK = \TestSuite10\EOSSDK\include

all : ethernet.out

ethernet.out : ethernet.c 
	$(CC) $(CFLAGS) -I $(EOSSDK) -e ethernet.err ethernet.c $(NETSDKLIB)
	vrxhdr ethernet.out  -s 655350 -h 655350 -l net.lib=N:15/net.lib	

clean :
	del *.o *.out *.p7s *.err *.bak
