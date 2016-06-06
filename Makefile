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

all : ethernet.out ethernet.p7s

ethernet.p7s : ethernet.out
	#filesign -c $(COMMON)\k2sign.crt -k $(COMMON)\k2sign.key -f ethernet.out -s ethernet.p7s
	vrxhdr ethernet.out  -s 655350 -h 655350 -l net.lib=N:15/net.lib
	FileSignature.exe -C "D:\TestSuite10\Common\SponsorCert.crt" -F "%cd%\ethernet.out" -CM
	rename ethernet.out.p7s ethernet.p7s

ethernet.out : ethernet.c 
	$(CC) $(CFLAGS) -I $(EOSSDK) -e ethernet.err ethernet.c $(NETSDKLIB)

clean :
	del *.o *.out *.p7s *.err *.bak
