#normal. - 1
#neptune. - 2
#smurf. - 3
#teardrop. - 4
#ipsweep. - 5
#buffer_overflow. - 6
#warezclient. - 7

#tcp - 1
#udp - 2
#icmp - 3

#http - 1
#smtp - 2 
#finger - 3
#domain_u - 4
#ecr_i - 5
#private - 6
#gopher - 7
#remote_job - 8
#rje - 8
#ctf - 10
#link - 11
#hostnames - 12
#eco_i - 13
#telnet - 14
#ftp_data - 15
#csnet_ns - 16
#iso_tsap - 17

#nnsp
#1_443
#exec
#login
#shell
#printer
#efs
#time
#courier
#uucp
#klogin
#kshell
#whois
#echo
#discard
#systat
#daytime
#domain
#ftp
#ssh
#mtp
#time
#name
#supdup
#auth


#SF - 1
#S0 - 2
#RSTO - 3
#ntp_u

f = open('my_data.csv', 'r').readlines()
f2 = open('my_data_labelled.csv', 'w')
for line in f:
#    for class
    line = line.replace('normal.', '1')
    line = line.replace('neptune.', '2')
    line = line.replace('smurf.', '3')
    line = line.replace('teardrop.', '4')
    line = line.replace('ipsweep.', '5')
    line = line.replace('buffer_overflow.', '6')
    line = line.replace('warezclient.', '7')

#    for f1
    line = line.replace('tcp', '1')
    line = line.replace('udp', '2')
    line = line.replace('icmp', '3')
    
#    for f2
    line = line.replace('http', '1')
    line = line.replace('smtp', '2')
    line = line.replace('finger', '3')
    line = line.replace('domain_u', '4')
    line = line.replace('ecr_i', '5') 
    line = line.replace('private', '6')
    line = line.replace('gopher', '7')
    line = line.replace('remote_job', '8')
    line = line.replace('rje', '9')
    line = line.replace('ctf', '10')
    line = line.replace('link', '11')
    line = line.replace('hostnames', '12')
    line = line.replace('eco_i', '13')
    line = line.replace('telnet', '14')
    line = line.replace('ftp_data', '15')
    line = line.replace('csnet_ns', '16')
    line = line.replace('iso_tsap', '17')
    line = line.replace('nnsp', '17')
    line = line.replace('1_443', '18')
    line = line.replace('exec', '19')
    line = line.replace('login', '20')
    line = line.replace('shell', '21')
    line = line.replace('printer', '22')
    line = line.replace('efs', '23')
    line = line.replace('time', '24')
    line = line.replace('courier', '25')
    line = line.replace('uucp', '26')
    line = line.replace('klogin', '27')
    line = line.replace('kshell', '28')
    line = line.replace('whois', '29')
    line = line.replace('echo', '30')
    line = line.replace('discard', '31')
    line = line.replace('systat', '32')
    line = line.replace('daytime', '33')
    line = line.replace('domain', '34')
    line = line.replace('ftp', '35')
    line = line.replace('ssh', '36')
    line = line.replace('mtp', '37')
    line = line.replace('time', '38')
    line = line.replace('name', '39')
    line = line.replace('supdup', '40')
    line = line.replace('auth', '41')
    
#    for f3
    line = line.replace('SF', '1')
    line = line.replace('S0', '2')
    line = line.replace('RSTO', '3')
    line = line.replace('ntp_u', '4')
    f2.write(line)
    
f2.close()
