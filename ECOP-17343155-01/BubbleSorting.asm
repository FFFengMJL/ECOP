

.text
.globl main

main:
  addi $t1,$zero,10	#t1=10����¼������������
  addi $t2,$zero,9	#t2=9����¼���ѭ����Ŀ����
  addi $t3,$zero,0	#t3=0����¼�ڲ�ѭ������
  addi $t4,$zero,0	#t4=0����¼��ǰ������Ԫ�ظ���
  la $t9, num_array	#������ĵ�ַ��num_array[0]����t9��

input:	#�û�����
  la $a0,str1		#���str1
  li $v0,4
  syscall  

  li $v0,5	#����5���Ӽ��̶���һ������
  syscall

  sw $v0, 0($t9)	#��v0ת�浽num_array[0]
  addi $t9,$t9,4	#ʹ$9ָ��������һλ(����4���ֽ�)
  addi $t4,$t4,1	#$t4������һ
  bne $t4,$t1,input	#��t4��t1����ȣ����������

  la $a0,str2		#���str2��׼����ʼBubble Sorting
  li $v0,4
  syscall 

outloop:
  la $t9,num_array	#load address ʹָ������ָ������ͷ
  move $t3,$zero	#���ڲ�ѭ���ļ���������ʼ��Ϊ0

inloop:
  lw $t5,0($t9)	#ȡ��a[i]
  lw $t6,4($t9)	#ȡ��a[i+1]
  bgt $t6,$t5,judge_inloop	#���a[i+1]С��a[i]����н��������a[i+1]����a[i]�����һ���ڲ�ѭ������ת��judge_inloop
  sw $t6,0($t9)
  sw $t5,4($t9)

judge_inloop:
  addi $t3,$t3,1	#t3++����ʾinloopִ��һ��
  addi $t9,$t9,4	#����ָ��ָ����һλ
  bne $t2,$t3,inloop	#�ж��ڲ�ѭ���Ƿ�ȫ�����(�Ƿ�$t2=t3)
  
print:	#����ڲ�ѭ��ȫ����ɣ�����������һλһ�������ģ���ʱ��ӡ
  lw $a0,0($t9)	#load word 
  li $v0,1	#��ӡ����
  syscall
  la $a0,space	#��ӡ�ո�
  li $v0,4
  syscall
  la $a0,greater_than	#��ӡ���ں�
  li $v0,4
  syscall
  la $a0,space	#��ӡ�ո�
  li $v0,4
  syscall

judge_outloop:
  addiu $t2,$t2,-1	 #outloop���һ��,num_array[$t2]�Ѿ�Ϊ��������,�´�ѭ�������ٽ��бȽ�
  bgtz $t2,outloop	#t2>0 ����ѭ��δ��� ����������ѭ��

  
  la $t9,num_array	#��ӡ���һ����
  lw $a0,0($t9)
  li $v0,1
  syscall
  
  #�˳�
  li $v0,10
  syscall


.data
  num_array:
    .space 40	#���10�����ֵ����飬һ������4���ֽڣ�10������40���ֽ� 
  str1: 
    .asciiz "Please input an integer: "	#��ʾ�û�����һ������
  str2:
    .asciiz "Bubble sorting: " 
  greater_than:
    .asciiz ">"
  space:
    .asciiz " " 