#!/bin/sh -x

cd ${WORKSPACE}/shift

# Serverspecが全てNG
echo 01
grep -E "OK=2," Shift_Log/Shift.8/Serverspec_Result_192.168.127.31.csv
result01=$?

echo 02
grep -E "OK=2," Shift_Log/Shift.8/Serverspec_Result_192.168.127.41.csv
result02=$?


# Ansibleの結果判定
echo 03
grep -E "192\.168\.127\.31\s*:\s*ok=[0-9]{1,3}\s*changed=[0-9]{1,3}\s*unreachable=0\s*failed=0" Shift_Log/Shift.7/Ansible.log
result03=$?

echo 04
grep -E "192\.168\.127\.41\s*:\s*ok=[0-9]{1,3}\s*changed=[0-9]{1,3}\s*unreachable=0\s*failed=0" Shift_Log/Shift.7/Ansible.log
result04=$?


# Serverspecの結果判定
echo 05
grep -E "NG=0," Shift_Log/Shift.6/Serverspec_Result_192.168.127.31.csv
result05=$?

echo 06
grep -E "NG=0," Shift_Log/Shift.6/Serverspec_Result_192.168.127.41.csv
result06=$?

# Ansibleの結果判定
echo 07
grep -E "192\.168\.127\.31\s*:\s*ok=[0-9]{1,3}\s*changed=0\s*unreachable=0\s*failed=0" Shift_Log/Shift.5/Ansible.log
result07=$?

echo 08
grep -E "192\.168\.127\.41\s*:\s*ok=[0-9]{1,3}\s*changed=0\s*unreachable=0\s*failed=0" Shift_Log/Shift.5/Ansible.log
result08=$?

echo 09
# Serverspecの結果判定
grep -E "NG=0," Shift_Log/Shift.4/Serverspec_Result_192.168.127.31.csv
result09=$?

echo 10
grep -E "NG=0," Shift_Log/Shift.4/Serverspec_Result_192.168.127.41.csv
result10=$?

# Ansibleの結果判定
echo 11
grep -E "192\.168\.127\.31\s*:\s*ok=[0-9]{1,3}\s*changed=[0-9]{1,3}\s*unreachable=0\s*failed=0" Shift_Log/Shift.3/Ansible.log
result11=$?

echo 12
grep -E "192\.168\.127\.41\s*:\s*ok=[0-9]{1,3}\s*changed=[0-9]{1,3}\s*unreachable=0\s*failed=0" Shift_Log/Shift.3/Ansible.log
result12=$?

# Serverspecの結果判定
echo 13
grep -E "NG=0," Shift_Log/Shift.2/Serverspec_Result_192.168.127.31.csv
result13=$?

echo 14
grep -E "NG=0," Shift_Log/Shift.2/Serverspec_Result_192.168.127.41.csv
result14=$?

# Ansibleの結果判定
echo 15
grep -E "192\.168\.127\.31\s*:\s*ok=[0-9]{1,3}\s*changed=[0-9]{1,3}\s*unreachable=0\s*failed=0" Shift_Log/Shift.1/Ansible.log
result15=$?

echo 16
grep -E "192\.168\.127\.41\s*:\s*ok=[0-9]{1,3}\s*changed=[0-9]{1,3}\s*unreachable=0\s*failed=0" Shift_Log/Shift.1/Ansible.log
result16=$?

# Serverspecの結果判定
echo 17
grep -E "NG=2," Shift_Log/Serverspec_Result_192.168.127.31.csv
result17=$?

echo 18
grep -E "NG=2," Shift_Log/Serverspec_Result_192.168.127.41.csv
result18=$?

exit $((result01 || result02 || result03 || result04 || result05 || result06 || result07 || result08 || result09 || result10 || result11 || result12 || result13 || result14 ))

