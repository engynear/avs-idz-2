	.file	"main.c"									# Имя файла
	.intel_syntax noprefix								# Синтаксис ассемблера
	.text									
	.def	printf;	.scl	3;	.type	32;	.endef
printf:													# Функция printf
	push	rbp											# Сохраняем последний rbp в стеке
	mov	rbp, rsp										# Сохраняем текущий rbp в rbp
	push	rbx											
	sub	rsp, 56
	mov	QWORD PTR 16[rbp], rcx							# Сохраняем аргументы в стеке
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	lea	rax, 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rbx, QWORD PTR -32[rbp]
	mov	ecx, 1
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax											# Вызываем функцию __acrt_iob_func
	mov	r8, rbx
	mov	rdx, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	__mingw_vfprintf							# Вызываем функцию __mingw_vfprintf
	mov	DWORD PTR -20[rbp], eax
	mov	eax, DWORD PTR -20[rbp]
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC0:													# Метка LC0 хранит аски коды символов, которые будем искать
	.ascii "if: %d, do: %d, count: %d, for: %d, else: %d\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
main:													# Функция main
	push	rbp											# Сохраняем последний rbp в стеке
	mov	rbp, rsp
	push	rbx
	and	rsp, -16
	sub	rsp, 1072
	call	__main
	mov	DWORD PTR 1064[rsp], 0							# Зануляем переменные счётчики слов
	mov	DWORD PTR 1060[rsp], 0
	mov	DWORD PTR 1056[rsp], 0
	mov	DWORD PTR 1052[rsp], 0
	mov	DWORD PTR 1048[rsp], 0
	mov	ecx, 0
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, 48[rsp]
	mov	r8, rdx
	mov	edx, 1000
	mov	rcx, rax
	call	fgets										# Считываем строку
	mov	DWORD PTR 1068[rsp], 0							# Зануляем переменную для хранения длины строки
	jmp	.L4
.L10: 													# Цикл для подсчёта if
	mov	eax, DWORD PTR 1068[rsp]						# Считываем длину строки		
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]					# Считываем символ строки
	cmp	al, 105											# Сравниваем символ с буквой i
	jne	.L5												# Если не равно, то переходим к следующему символу
	mov	eax, DWORD PTR 1068[rsp]						# Если равно, то считываем длину строки
	add	eax, 1											# Добавляем 1 к длине строки
	cdqe												# Преобразуем длину строки в 64 битное число
	movzx	eax, BYTE PTR 48[rsp+rax]					# Считываем символ строки					
	cmp	al, 102											# Сравниваем символ с буквой f
	jne	.L5												# Если не равно, то переходим к следующему символу
	add	DWORD PTR 1064[rsp], 1							# Если равно, то увеличиваем счётчик слов if на 1
.L5:													# Цикл для подсчёта do (аналогично if)
	mov	eax, DWORD PTR 1068[rsp]
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]
	cmp	al, 100
	jne	.L6
	mov	eax, DWORD PTR 1068[rsp]
	add	eax, 1
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]
	cmp	al, 111
	jne	.L6
	add	DWORD PTR 1060[rsp], 1
.L6:													# Цикл для подсчёта int (аналогично if)
	mov	eax, DWORD PTR 1068[rsp]
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]
	cmp	al, 105											
	jne	.L7
	mov	eax, DWORD PTR 1068[rsp]
	add	eax, 1
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]
	cmp	al, 110
	jne	.L7
	mov	eax, DWORD PTR 1068[rsp]
	add	eax, 2
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]
	cmp	al, 116
	jne	.L7
	add	DWORD PTR 1056[rsp], 1
.L7:													# Цикл для подсчёта for (аналогично if)
	mov	eax, DWORD PTR 1068[rsp]
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]
	cmp	al, 102
	jne	.L8
	mov	eax, DWORD PTR 1068[rsp]
	add	eax, 1
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]
	cmp	al, 111
	jne	.L8
	mov	eax, DWORD PTR 1068[rsp]
	add	eax, 2
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]
	cmp	al, 114
	jne	.L8
	add	DWORD PTR 1052[rsp], 1
.L8:													# Цикл для подсчёта else (аналогично if)
	mov	eax, DWORD PTR 1068[rsp]
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]
	cmp	al, 101
	jne	.L9
	mov	eax, DWORD PTR 1068[rsp]
	add	eax, 1
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]
	cmp	al, 108
	jne	.L9
	mov	eax, DWORD PTR 1068[rsp]
	add	eax, 2
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]
	cmp	al, 115
	jne	.L9
	mov	eax, DWORD PTR 1068[rsp]
	add	eax, 3
	cdqe
	movzx	eax, BYTE PTR 48[rsp+rax]
	cmp	al, 101
	jne	.L9
	add	DWORD PTR 1048[rsp], 1
.L9:
	add	DWORD PTR 1068[rsp], 1
.L4:													# Проверка на конец строки и вывод результатов
	mov	eax, DWORD PTR 1068[rsp]
	movsx	rbx, eax
	lea	rax, 48[rsp]									
	mov	rcx, rax
	call	strlen										# Вызов функции strlen
	cmp	rbx, rax										# Сравниваем с индексом символа
	jb	.L10											# Если меньше, то переходим к следующему символу
	mov	r8d, DWORD PTR 1056[rsp]						# Иначе формируем результаты
	mov	ecx, DWORD PTR 1060[rsp]
	mov	eax, DWORD PTR 1064[rsp]
	mov	edx, DWORD PTR 1048[rsp]
	mov	DWORD PTR 40[rsp], edx
	mov	edx, DWORD PTR 1052[rsp]
	mov	DWORD PTR 32[rsp], edx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, eax
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	printf											# Вывод результатов
	mov	eax, 0
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.ident	"GCC: (Rev10, Built by MSYS2 project) 11.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
