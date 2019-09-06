

.text
.globl main

main:
  addi $t1,$zero,10	#t1=10，记录数组的最大容量
  addi $t2,$zero,9	#t2=9，记录外层循环的目标数
  addi $t3,$zero,0	#t3=0，记录内层循环次数
  addi $t4,$zero,0	#t4=0，记录当前数组中元素个数
  la $t9, num_array	#将数组的地址（num_array[0]赋给t9）

input:	#用户输入
  la $a0,str1		#输出str1
  li $v0,4
  syscall  

  li $v0,5	#功能5，从键盘读入一个整数
  syscall

  sw $v0, 0($t9)	#将v0转存到num_array[0]
  addi $t9,$t9,4	#使$9指向数组下一位(相邻4个字节)
  addi $t4,$t4,1	#$t4计数加一
  bne $t4,$t1,input	#当t4与t1不相等，则继续输入

  la $a0,str2		#输出str2，准备开始Bubble Sorting
  li $v0,4
  syscall 

outloop:
  la $t9,num_array	#load address 使指针重新指向数组头
  move $t3,$zero	#将内层循环的计数变量初始化为0

inloop:
  lw $t5,0($t9)	#取出a[i]
  lw $t6,4($t9)	#取出a[i+1]
  bgt $t6,$t5,judge_inloop	#如果a[i+1]小于a[i]则进行交换，如果a[i+1]大于a[i]则完成一次内层循环，跳转到judge_inloop
  sw $t6,0($t9)
  sw $t5,4($t9)

judge_inloop:
  addi $t3,$t3,1	#t3++，表示inloop执行一次
  addi $t9,$t9,4	#数组指针指向下一位
  bne $t2,$t3,inloop	#判断内层循环是否全部完成(是否$t2=t3)
  
print:	#如果内层循环全部完成，则数组的最后一位一定是最大的，此时打印
  lw $a0,0($t9)	#load word 
  li $v0,1	#打印整数
  syscall
  la $a0,space	#打印空格
  li $v0,4
  syscall
  la $a0,greater_than	#打印大于号
  li $v0,4
  syscall
  la $a0,space	#打印空格
  li $v0,4
  syscall

judge_outloop:
  addiu $t2,$t2,-1	 #outloop完成一次,num_array[$t2]已经为最大的数字,下次循环不需再进行比较
  bgtz $t2,outloop	#t2>0 则外循环未完成 继续进行外循环

  
  la $t9,num_array	#打印最后一个数
  lw $a0,0($t9)
  li $v0,1
  syscall
  
  #退出
  li $v0,10
  syscall


.data
  num_array:
    .space 40	#存放10个数字的数组，一个整数4个字节，10个整数40个字节 
  str1: 
    .asciiz "Please input an integer: "	#提示用户输入一个整数
  str2:
    .asciiz "Bubble sorting: " 
  greater_than:
    .asciiz ">"
  space:
    .asciiz " " 