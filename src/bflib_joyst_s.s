
#ifdef NEED_UNDERSCORE
# define TRANSFORM_SYMBOLS
# define EXPORT_SYMBOL(sym) _ ## sym
#endif

#ifndef TRANSFORM_SYMBOLS

# define GLOBAL(sym) \
  .global sym; \
  sym ##:

# define GLOBAL_FUNC(sym) \
  GLOBAL (sym)

#else

# define GLOBAL(sym) \
  .global EXPORT_SYMBOL (sym); \
  EXPORT_SYMBOL (sym) ##: \
  sym ##:

# define GLOBAL_FUNC(sym) \
  .global sym; \
  GLOBAL (sym)

#endif


.text

.global EXPORT_SYMBOL(___CHK);


/*----------------------------------------------------------------*/
GLOBAL_FUNC (joy_grip_init)
/*----------------------------------------------------------------*/
		push   %ebx
		push   %ecx
		push   %edx
		push   %esi
		push   %edi
		push   %ebp
		sub    $0x84,%esp
		cmpb   $0x0,data_1e2f35
		jne    jump_e117a
		mov    %esp,%ebx
		mov    $data_158b68,%edx
		mov    $data_158b5c,%eax
		call   ___searchenv_
		mov    -0x3(%esp),%eax
		sar    $0x18,%eax
		test   %eax,%eax
		jne    jump_e1076
		mov    %esp,%ebx
		mov    $data_15ed1c,%edx
		mov    $data_158b5c,%eax
		call   ___searchenv_
	jump_e1076:
		mov    -0x3(%esp),%eax
		sar    $0x18,%eax
		test   %eax,%eax
		jne    jump_e10cb
		mov    $data_158b70,%esi
		mov    %esp,%edi
		push   %edi
	jump_e1089:
		mov    (%esi),%al
		mov    %al,(%edi)
		cmp    $0x0,%al
		je     jump_e10a1
		mov    0x1(%esi),%al
		add    $0x2,%esi
		mov    %al,0x1(%edi)
		add    $0x2,%edi
		cmp    $0x0,%al
		jne    jump_e1089
	jump_e10a1:
		pop    %edi
		mov    $data_158b5c,%esi
		mov    %esp,%edi
		push   %edi
		sub    %ecx,%ecx
		dec    %ecx
		mov    $0x0,%al
		repnz scas %es:(%edi),%al
		dec    %edi
	jump_e10b2:
		mov    (%esi),%al
		mov    %al,(%edi)
		cmp    $0x0,%al
		je     jump_e10ca
		mov    0x1(%esi),%al
		add    $0x2,%esi
		mov    %al,0x1(%edi)
		add    $0x2,%edi
		cmp    $0x0,%al
		jne    jump_e10b2
	jump_e10ca:
		pop    %edi
	jump_e10cb:
		mov    $data_15ed21,%edx
		mov    %esp,%eax
		call   ac_dos_fopen
		mov    %eax,%esi
		test   %eax,%eax
		jne    jump_e10e7
		mov    $0xffffffff,%eax
		jmp    jump_e116e
	jump_e10e7:
		mov    $0x2,%ebx
		xor    %edx,%edx
		call   ac_fseek
		mov    %esi,%eax
		call   ac_ftell
		mov    %eax,%ebp
		mov    %eax,0x80(%esp)
		cmp    $0x8000,%eax
		jle    jump_e1111
		mov    $0xffffffff,%eax
		jmp    jump_e116e
	jump_e1111:
		call   ac_LbMemoryAlloc
		mov    %eax,%edi
		test   %eax,%eax
		jne    jump_e1123
		mov    $0xffffffff,%eax
		jmp    jump_e116e
	jump_e1123:
		mov    %esi,%eax
		xor    %ebx,%ebx
		xor    %edx,%edx
		call   ac_fseek
		mov    %esi,%ecx
		mov    $0x1,%edx
		mov    %ebp,%ebx
		mov    %edi,%eax
		call   ac_fread
		mov    %esi,%eax
		xor    %edx,%edx
		call   ac_fclose
		mov    0x80(%esp),%dx
		mov    %edi,%eax
		call   joy_func_f2680
		test   %ax,%ax
		jne    jump_e1162
		mov    $0xffffffff,%eax
		jmp    jump_e116e
	jump_e1162:
		mov    %edi,%eax
		call   LbMemoryFree_
		mov    $0x1,%eax
	jump_e116e:
		cmp    $0x1,%eax
		jne    jump_e117a
		movb   $0x1,data_1e2f35
	jump_e117a:
		cmpb   $0x0,data_1e2f37
		jne    jump_e1196
		xor    %eax,%eax
		call   func_f36fd
		test   %ax,%ax
		je     jump_e1196
		movb   $0x1,data_1e2f37
	jump_e1196:
		mov    $0x1,%eax
		add    $0x84,%esp
		pop    %ebp
		pop    %edi
		pop    %esi
		pop    %edx
		pop    %ecx
		pop    %ebx
	jump_e11a7:
		ret


/*----------------------------------------------------------------*/
GLOBAL_FUNC (joy_grip_shutdown)
/*----------------------------------------------------------------*/
		cmpb   $0x0,data_1e2f35
		je     jump_e11c9
		cmpb   $0x0,data_1e2f36
		je     jump_e11c4
		mov    $0x84a2,%ax
		lcall  *data_1e5ef8
	jump_e11c4:
		call   func_f2974
	jump_e11c9:
		cmpb   $0x0,data_1e2f37
		je     jump_e11a7
		xor    %eax,%eax
		jmp    jump_f38b9

/*----------------------------------------------------------------*/
joy_func_f2680:
/*----------------------------------------------------------------*/
		push   %ebx
		push   %ecx
		push   %esi
		push   %edi
		push   %ebp
		sub    $0x4,%esp
		mov    %eax,%ebx
		mov    data_1e5f00,%ecx
		test   %ecx,%ecx
		je     jump_f269b
		xor    %eax,%ebx
		jmp    jump_f2968
	jump_f269b:
		test   %eax,%eax
		je     jump_f26a9
		xor    %esi,%esi
		mov    %dx,%si
		cmp    $0x10,%esi
		jge    jump_f26b6
	jump_f26a9:
		xor    %ebx,%ebx
		mov    %ebx,%eax
		add    $0x4,%esp
		pop    %ebp
		pop    %edi
		pop    %esi
		pop    %ecx
		pop    %ebx
		ret
	jump_f26b6:
		xor    %eax,%eax
		mov    (%ebx),%al
		cmp    $0x44,%eax
		jne    jump_f26c9
		xor    %eax,%eax
		mov    0x1(%ebx),%al
		cmp    $0x42,%eax
		je     jump_f26d6
	jump_f26c9:
		xor    %ebx,%ebx
		mov    %ebx,%eax
		add    $0x4,%esp
		pop    %ebp
		pop    %edi
		pop    %esi
		pop    %ecx
		pop    %ebx
		ret
	jump_f26d6:
		mov    0x2(%ebx),%dl
		mov    0x3(%ebx),%al
		and    $0xf,%dl
		and    $0xf,%al
		xor    %dh,%dh
		xor    %ch,%ah
		shl    $0xc,%edx
		shl    $0x8,%eax
		or     %eax,%edx
		mov    0x4(%ebx),%al
		and    $0xf,%al
		xor    %ah,%ah
		shl    $0x4,%eax
		mov    0x5(%ebx),%cl
		or     %eax,%edx
		mov    0x6(%ebx),%al
		and    $0xf,%cl
		and    $0xf,%al
		xor    %ch,%ch
		xor    %ah,%ah
		or     %edx,%ecx
		mov    %eax,%edx
		mov    0x7(%ebx),%al
		and    $0xf,%al
		shl    $0xc,%edx
		shl    $0x8,%eax
		or     %eax,%edx
		mov    0x8(%ebx),%al
		and    $0xf,%al
		xor    %ah,%ah
		shl    $0x4,%eax
		or     %eax,%edx
		mov    0x9(%ebx),%al
		and    $0xf,%al
		movzbw %al,%di
		mov    0xa(%ebx),%ah
		or     %edx,%edi
		and    $0xf,%ah
		movzwl %di,%ebp
		xor    %edx,%edx
		shl    $0x4,%ah
		mov    %cx,%dx
		mov    0xb(%ebx),%al
		add    %edx,%ebp
		and    $0xf,%al
		shl    $0x4,%ebp
		or     %ah,%al
		cmp    %ebp,%esi
		jge    jump_f275e
		xor    %ebx,%ebx
		mov    %ebx,%eax
		add    $0x4,%esp
		pop    %ebp
		pop    %edi
		pop    %esi
		pop    %ecx
		pop    %ebx
		ret
	jump_f275e:
		shl    $0x4,%edx
		add    %edx,%ebx
		mov    %ebx,(%esp)
		mov    (%esp),%edx
		xor    %ebx,%ebx
		jmp    jump_f2773
	jump_f276d:
		mov    (%edx),%ah
		inc    %edx
		inc    %ebx
		xor    %ah,%al
	jump_f2773:
		xor    %esi,%esi
		mov    %di,%si
		shl    $0x4,%esi
		cmp    %esi,%ebx
		jl     jump_f276d
		and    $0xff,%eax
		je     jump_f2793
		xor    %ebx,%ebx
		mov    %ebx,%eax
		add    $0x4,%esp
		pop    %ebp
		pop    %edi
		pop    %esi
		pop    %ecx
		pop    %ebx
		ret
	jump_f2793:
		mov    $data_1e5f06,%ecx
		mov    %edi,%ebx
		mov    $0x100,%eax
		int    $0x31
		mov    $0x0,%ebx
		jb     jump_f27b0
		mov    %eax,%ebx
		shl    $0x4,%ebx
		mov    %dx,(%ecx)
	jump_f27b0:
		mov    %ebx,%ebp
		test   %ebx,%ebx
		jne    jump_f27c3
		xor    %ebx,%ebx
		mov    %ebx,%eax
		add    $0x4,%esp
		pop    %ebp
		pop    %edi
		pop    %esi
		pop    %ecx
		pop    %ebx
		ret
	jump_f27c3:
		mov    %ebx,%edx
		xor    %esi,%esi
		mov    (%esp),%ebx
		jmp    jump_f27d8
	jump_f27cc:
		add    $0x4,%edx
		mov    (%ebx),%eax
		add    $0x4,%ebx
		inc    %esi
		mov    %eax,-0x4(%edx)
	jump_f27d8:
		xor    %eax,%eax
		mov    %di,%ax
		shl    $0x2,%eax
		cmp    %eax,%esi
		jl     jump_f27cc
		xor    %edx,%edx
		mov    $0x0,%eax
		mov    $0x1,%ecx
		int    $0x31
		jae    jump_f27f6
		xor    %eax,%eax
	jump_f27f6:
		mov    %ax,%dx
		mov    %ax,data_1e5f04
		test   %edx,%edx
		jne    jump_f2822
		mov    data_1e5f06,%dx
		mov    $0x101,%eax
		int    $0x31
		jb     jump_f2815
		xor    %eax,%eax
	jump_f2815:
		xor    %ebx,%ebx
		mov    %ebx,%eax
		add    $0x4,%esp
		pop    %ebp
		pop    %edi
		pop    %esi
		pop    %ecx
		pop    %ebx
		ret
	jump_f2822:
		mov    %edi,%esi
		mov    %ebp,%edx
		mov    %eax,%ebx
		shl    $0x4,%esi
		mov    %edx,%ecx
		shr    $0x10,%ecx
		mov    $0x7,%eax
		int    $0x31
		jb     jump_f2849
		mov    %esi,%edx
		dec    %edx
		xor    %ecx,%ecx
		mov    $0x8,%eax
		int    $0x31
		jb     jump_f2849
		xor    %eax,%eax
	jump_f2849:
		and    $0xff,%eax
		je     jump_f2880
		mov    data_1e5f04,%bx
		mov    $0x1,%eax
		int    $0x31
		setb   %al
		mov    data_1e5f06,%dx
		mov    $0x101,%eax
		int    $0x31
		jb     jump_f2873
		xor    %eax,%eax
	jump_f2873:
		xor    %ebx,%ebx
		mov    %ebx,%eax
		add    $0x4,%esp
		pop    %ebp
		pop    %edi
		pop    %esi
		pop    %ecx
		pop    %ebx
		ret
	jump_f2880:
		mov    data_1e5f04,%bx
		mov    %cs,%cx
		lar    %ecx,%ecx
		shr    $0x8,%cx
		mov    $0x9,%eax
		int    $0x31
		setb   %al
		and    $0xff,%eax
		je     jump_f28d2
		mov    data_1e5f04,%bx
		mov    $0x1,%eax
		int    $0x31
		setb   %al
		mov    data_1e5f06,%dx
		mov    $0x101,%eax
		int    $0x31
		jb     jump_f28c5
		xor    %eax,%eax
	jump_f28c5:
		xor    %ebx,%ebx
		mov    %ebx,%eax
		add    $0x4,%esp
		pop    %ebp
		pop    %edi
		pop    %esi
		pop    %ecx
		pop    %ebx
		ret
	jump_f28d2:
		mov    (%esp),%ebx
		xor    %edx,%edx
	jump_f28d7:
		inc    %edx
		mov    (%ebx),%al
		inc    %ebx
		mov    %al,data_1e5eef(%edx)
		cmp    $0xe,%edx
		jb     jump_f28d7
		xor    %edx,%edx
		mov    data_1e5f04,%ax
		mov    %dx,data_1e5ef2
		mov    %ax,data_1e5ef6
		mov    %ax,data_1e5efc
		mov    %dx,0x12(%ebp)
		mov    %dx,0x16(%ebp)
		mov    %dx,0x10(%ebp)
		mov    data_1e5f06,%ax
		mov    %ax,0x14(%ebp)
		mov    $0x8490,%ax
		lcall  *data_1e5ef8
		and    $0xffff,%eax
		jne    jump_f2958
		mov    data_1e5f04,%bx
		mov    $0x1,%eax
		int    $0x31
		setb   %al
		mov    data_1e5f06,%dx
		mov    $0x101,%eax
		int    $0x31
		jb     jump_f294b
		xor    %eax,%eax
	jump_f294b:
		xor    %ebx,%ebx
		mov    %ebx,%eax
		add    $0x4,%esp
		pop    %ebp
		pop    %edi
		pop    %esi
		pop    %ecx
		pop    %ebx
		ret
	jump_f2958:
		mov    $0x1,%esi
		mov    $0x1,%ebx
		mov    %esi,data_1e5f00
	jump_f2968:
		mov    %ebx,%eax
		add    $0x4,%esp
		pop    %ebp
		pop    %edi
		pop    %esi
		pop    %ecx
		pop    %ebx
		ret


/*----------------------------------------------------------------*/
func_f2974:
/*----------------------------------------------------------------*/
		push   %ebx
		push   %edx
		cmpl   $0x0,data_1e5f00
		jne    jump_f2984
		xor    %eax,%eax
		pop    %edx
		pop    %ebx
		ret
	jump_f2984:
		mov    $0x8491,%ax
		lcall  *data_1e5ef8
		mov    data_1e5f04,%bx
		mov    $0x1,%eax
		int    $0x31
		setb   %al
		and    $0xff,%eax
		je     jump_f29ab
		xor    %eax,%eax
		pop    %edx
		pop    %ebx
		ret
	jump_f29ab:
		mov    data_1e5f06,%dx
		mov    $0x101,%eax
		int    $0x31
		jb     jump_f29bd
		xor    %eax,%eax
	jump_f29bd:
		and    $0xff,%eax
		je     jump_f29c9
		xor    %eax,%eax
		pop    %edx
		pop    %ebx
		ret
	jump_f29c9:
		mov    %eax,data_1e5f00
		mov    $0x1,%eax
		pop    %edx
		pop    %ebx
		ret


/*----------------------------------------------------------------*/
func_f2e25:
/*----------------------------------------------------------------*/
		push   $0x8
		call   ____CHK
		push   %edx
		cwtl
		shl    $0x2,%eax
		movzwl (%eax),%edx
		add    $0x2,%eax
		movzwl (%eax),%eax
		shl    $0x4,%eax
		add    %edx,%eax
		pop    %edx
		ret


/*----------------------------------------------------------------*/
func_f2e87:
/*----------------------------------------------------------------*/
		push   $0x8
		call   ____CHK
		push   %edx
		mov    $0x20,%edx
		jmp    jump_f2ea8
	jump_f2e99:
		call   func_f2e44
		test   %ax,%ax
		je     jump_f2ea7
		mov    %edx,%eax
		pop    %edx
		ret
	jump_f2ea7:
		inc    %edx
	jump_f2ea8:
		movswl %dx,%eax
		cmp    $0x100,%eax
		jl     jump_f2e99
		xor    %eax,%eax
		pop    %edx
		ret


/*----------------------------------------------------------------*/
func_f2eb6:
/*----------------------------------------------------------------*/
		push   $0x14
		call   ____CHK
		push   %ecx
		push   %esi
		push   %edi
		sub    $0x4,%esp
		mov    %eax,%edi
		mov    %edx,(%esp)
		mov    %ebx,%esi
		cmpl   $0x1,data_158d9e
		jne    jump_f2edd
		xor    %eax,%eax
		jmp    jump_f2fc5
	jump_f2edd:
		cmpw   $0x0,data_158d9c
		jne    jump_f2ef1
		mov    $0x8002,%eax
		jmp    jump_f2fc5
	jump_f2ef1:
		test   %ebx,%ebx
		je     jump_f2efb
		movl   $0xff0000ff,(%ebx)
	jump_f2efb:
		test   %esi,%esi
		je     jump_f2f1f
		movzwl data_1e5f18,%eax
		shl    $0x4,%eax
		mov    %esi,%edx
		mov    $0xa4,%ebx
	jump_f2f10:
		dec    %ebx
		cmp    $0xffffffff,%bx
		je     jump_f2f1f
		mov    (%edx),%cl
		mov    %cl,(%eax)
		inc    %edx
		inc    %eax
		jmp    jump_f2f10
	jump_f2f1f:
		movswl %di,%eax
		mov    %eax,data_1e5f60
		movswl (%esp),%eax
		mov    %eax,data_1e5f58
		mov    data_1e5f18,%ax
		mov    %ax,data_1e5f66
		movl   $0x0,data_1e5f54
		movw   $0x300,data_1e5f28
		mov    data_158d9c,%al
		mov    %al,data_1e5f2c
		movb   $0x0,data_1e5f2d
		movw   $0x0,data_1e5f30
		mov    %ds,%edx
		mov    $data_1e5f44,%eax
		mov    %dx,data_1e5f1c
		movl   $data_1e5f44,data_1e5f3c
		mov    $data_1e5f1c,%ecx
		mov    $data_1e5f28,%ebx
		mov    %ebx,%edx
		mov    $0x31,%eax
		call   ac_dos_int386x
		test   %esi,%esi
		je     jump_f2fbb
		movzwl data_1e5f18,%eax
		shl    $0x4,%eax
		mov    %esi,%edx
		mov    $0xa4,%ebx
	jump_f2fac:
		dec    %ebx
		cmp    $0xffffffff,%bx
		je     jump_f2fbb
		mov    (%eax),%cl
		mov    %cl,(%edx)
		inc    %eax
		inc    %edx
		jmp    jump_f2fac
	jump_f2fbb:
		mov    data_1e5f60,%eax
		and    $0xffff,%eax
	jump_f2fc5:
		add    $0x4,%esp
		pop    %edi
		pop    %esi
		pop    %ecx
		ret


/*----------------------------------------------------------------*/
func_f2e44:
/*----------------------------------------------------------------*/
		push   $0xc
		call   ____CHK
		push   %ebx
		push   %edx
		cwtl
		call   func_f2e25
		mov    %eax,%ebx
		test   %eax,%eax
		jne    jump_f2e61
	jump_f2e5c:
		xor    %eax,%eax
		pop    %edx
		pop    %ebx
		ret
	jump_f2e61:
		mov    $data_15f54b,%eax
		add    $0x6,%ebx
	jump_f2e69:
		cmpb   $0x0,(%eax)
		je     jump_f2e7a
		mov    %ebx,%edx
		inc    %ebx
		mov    (%edx),%dl
		cmp    (%eax),%dl
		jne    jump_f2e7a
		inc    %eax
		jmp    jump_f2e69
	jump_f2e7a:
		cmpb   $0x0,(%eax)
		jne    jump_f2e5c
		mov    $0x1,%eax
		pop    %edx
		pop    %ebx
		ret


/*----------------------------------------------------------------*/
func_f30a5:
/*----------------------------------------------------------------*/
		push   $0x30
		call   ____CHK
		push   %ebx
		push   %ecx
		push   %esi
		push   %edi
		sub    $0x1c,%esp
		mov    %edx,%ecx
		cmpl   $0x0,data_158da6
		jne    jump_f30d3
		mov    data_158da2,%eax
		call   ac_strlen
		sub    $0x4,%eax
		mov    %eax,data_158da6
	jump_f30d3:
		movw   $0x400,(%esp)
		mov    %esp,%ebx
		mov    %esp,%edx
		mov    $0x1a,%eax
		call   ac_dos_int386
		movswl 0xc(%esp),%eax
		sar    $0x8,%eax
		and    $0xff,%eax
		mov    %eax,%edx
		xor    %ah,%dh
		and    $0xf0,%dl
		movswl %dx,%edx
		sar    $0x4,%edx
		imul   $0xa,%edx,%edx
		xor    %ah,%ah
		and    $0xf,%al
		cwtl
		add    %edx,%eax
		mov    0xc(%esp),%edx
		xor    %dh,%dh
		and    $0xf0,%dl
		movswl %dx,%edx
		sar    $0x4,%edx
		imul   $0xa,%edx,%ebx
		mov    0xc(%esp),%edx
		xor    %dh,%dh
		and    $0xf,%dl
		movswl %dx,%edx
		add    %ebx,%edx
		cwtl
		mov    %eax,%esi
		shl    $0x2,%esi
		movswl %dx,%edx
		mov    $0x7,%ebx
		mov    %edx,%eax
		sar    $0x1f,%edx
		idiv   %ebx
		mov    %esi,%edx
		sub    %eax,%edx
		imul   data_158da6,%edx
		mov    $0x34,%ebx
		mov    %edx,%eax
		sar    $0x1f,%edx
		idiv   %ebx
		mov    data_158da2,%edi
		add    %eax,%edi
		xor    %eax,%eax
		mov    $0x3,%esi
		jmp    jump_f3170
	jump_f3168:
		mov    (%edi,%eax,1),%bl
		mov    %bl,(%ecx,%esi,1)
		dec    %esi
		inc    %eax
	jump_f3170:
		cmp    $0x4,%eax
		jl     jump_f3168
		add    $0x1c,%esp
		pop    %edi
		pop    %esi
		pop    %ecx
		pop    %ebx
		ret


/*----------------------------------------------------------------*/
func_f3199:
/*----------------------------------------------------------------*/
		push   $0x8
		call   ____CHK
		push   %edx
		mov    $data_1e5f10,%edx
		mov    $0x1,%eax
		call   func_f30a5
		incw   data_158dac
		pop    %edx
		ret


/*----------------------------------------------------------------*/
func_f335a:
/*----------------------------------------------------------------*/
		push   $0x2c
		call   ____CHK
		push   %ebx
		push   %ecx
		push   %edx
		sub    $0x1c,%esp
		mov    %eax,%ecx
		test   %eax,%eax
		jne    jump_f3380
		movw   $0x8011,data_1e5f1a
	jump_f3379:
		xor    %eax,%eax
		jmp    jump_f33f2
	jump_f3380:
		movw   $0x100,(%esp)
		movw   $0xc0,0x4(%esp)
		mov    %esp,%ebx
		mov    %esp,%edx
		mov    $0x31,%eax
		call   ac_dos_int386
		mov    (%esp),%eax
		mov    %ax,data_1e5f18
		cmpl   $0x0,0x18(%esp)
		je     jump_f33b6
		movw   $0x8010,data_1e5f1a
		jmp    jump_f3379
	jump_f33b6:
		call   func_f2e87
		mov    %ax,data_158d9c
		test   %ax,%ax
		jne    jump_f33d1
		movw   $0x8001,data_1e5f1a
		jmp    jump_f33f2
	jump_f33d1:
		mov    %ecx,%ebx
		xor    %edx,%edx
		mov    $0xffff8001,%eax
		call   func_f2eb6
		mov    %eax,%edx
		test   %eax,%eax
		je     jump_f33ed
		mov    %ax,data_1e5f1a
		jmp    jump_f3379
	jump_f33ed:
		mov    $0x1,%eax
	jump_f33f2:
		add    $0x1c,%esp
		pop    %edx
		pop    %ecx
		pop    %ebx
		ret


/*----------------------------------------------------------------*/
func_f36fd:
/*----------------------------------------------------------------*/
		push   $0x158
		call   ____CHK
		push   %ebx
		push   %ecx
		push   %edx
		sub    $0x148,%esp
		mov    %eax,%ecx
		lea    0xa4(%esp),%eax
		call   func_f335a
		test   %ax,%ax
		je     jump_f38a7
		movswl %cx,%ebx
		lea    0xa4(%esp),%edx
		mov    %ebx,%eax
		call   func_f3432
		test   %ax,%ax
		je     jump_f38a7
		mov    %ebx,%eax
		call   func_f34a1
		test   %ax,%ax
		je     jump_f38a7
		call   func_f3199
		movl   $0x0,data_158dc2
		movl   $0x0,data_158dbe
	jump_f376a:
		movswl %cx,%edx
		mov    %esp,%ebx
		mov    $0xffff8022,%eax
		call   func_f2eb6
		mov    $0xc8,%eax
		call   delay_
		movl   $0x0,data_158dd2
		movl   $0x7,data_158dce
	jump_f3797:
		mov    data_158dce,%eax
		movswl 0x4(%esp,%eax,2),%edx
		mov    data_158dd2,%eax
		cmp    data_158bbc(,%eax,4),%edx
		jne    jump_f37c7
		mov    data_158dce,%eax
		movswl 0x6(%esp,%eax,2),%edx
		mov    data_158dd2,%eax
		cmp    data_158bc0(,%eax,4),%edx
		je     jump_f37cd
	jump_f37c7:
		incl   data_158dc6
	jump_f37cd:
		mov    data_158dce,%eax
		movswl 0x4(%esp,%eax,2),%edx
		mov    data_158dd2,%eax
		cmp    data_158cbc(,%eax,4),%edx
		jne    jump_f37fd
		mov    data_158dce,%eax
		movswl 0x6(%esp,%eax,2),%edx
		mov    data_158dd2,%eax
		cmp    data_158cc0(,%eax,4),%edx
		je     jump_f3803
	jump_f37fd:
		incl   data_158dca
	jump_f3803:
		addl   $0x2,data_158dd2
		addl   $0x3,data_158dce
		cmpl   $0x11,data_158dce
		jl     jump_f3797
		cmpl   $0x0,data_158dc6
		jle    jump_f3837
		movl   $0x0,data_158dc6
		incl   data_158dc2
	jump_f3837:
		cmpl   $0x0,data_158dca
		jle    jump_f3850
		movl   $0x0,data_158dca
		incl   data_158dc2
	jump_f3850:
		cmpl   $0x7,data_158dc2
		jle    jump_f387e
		movw   $0x8103,data_1e5f1a
		mov    $0x7,%eax
		call   _putch
		movswl %cx,%eax
		call   func_f3463
		movl   $0x0,data_158dc2
	jump_f387e:
		incl   data_158dbe
		cmpl   $0x4,data_158dbe
		jl     jump_f376a
		movswl %cx,%edx
		mov    %esp,%ebx
		mov    $0xffff8023,%eax
		call   func_f2eb6
		mov    $0x1,%eax
		jmp    jump_f38af
	jump_f38a7:
		mov    %ax,data_1e5f1a
		xor    %eax,%eax
	jump_f38af:
		add    $0x148,%esp
		pop    %edx
		pop    %ecx
		pop    %ebx
		ret

/*----------------------------------------------------------------*/
func_f324f:
/*----------------------------------------------------------------*/
		push   $0x14
		call   ____CHK
		push   %ebx
		push   %ecx
		push   %esi
		sub    $0x4,%esp
		mov    %eax,%esi
		mov    %edx,%ebx
		cmpl   $0x0,data_158dae
		je     jump_f328c
		xor    %edx,%edx
	jump_f326e:
		movb   $0x0,data_1e5f7a(%edx)
		movb   $0x0,data_1e5f76(%edx)
		inc    %edx
		cmp    $0x4,%edx
		jl     jump_f326e
		movl   $0x0,data_158dae
	jump_f328c:
		mov    $0x20,%ecx
		mov    %ebx,%eax
		mov    %ebx,%edx
		sar    $0x1f,%edx
		idiv   %ecx
		mov    %ecx,%eax
		sub    %edx,%eax
		lea    -0x1(%eax),%ecx
		test   %ecx,%ecx
		jne    jump_f32aa
		call   func_f3199
	jump_f32aa:
		mov    %ecx,%eax
		mov    %ecx,%edx
		sar    $0x1f,%edx
		shl    $0x3,%edx
		sbb    %edx,%eax
		sar    $0x3,%eax
		mov    %eax,%ebx
		movl   $0x8,(%esp)
		mov    %ecx,%eax
		mov    %ecx,%edx
		sar    $0x1f,%edx
		idivl  (%esp)
		mov    %dl,%cl
		mov    $0x1,%eax
		shl    %cl,%eax
		or     %al,data_1e5f76(%ebx)
		mov    %al,%ah
		not    %ah
		and    %ah,data_1e5f7a(%ebx)
		and    $0x1,%esi
		movzwl %si,%edx
		test   %edx,%edx
		je     jump_f32f5
		or     %al,data_1e5f7a(%ebx)
	jump_f32f5:
		xor    %ebx,%ebx
		xor    %edx,%edx
	jump_f32f9:
		mov    $0x7,%eax
		jmp    jump_f3314
	jump_f3300:
		movzbl data_1e5f76(%edx),%esi
		mov    %al,%cl
		sar    %cl,%esi
		mov    %esi,%ecx
		test   $0x1,%cl
		je     jump_f3313
		inc    %ebx
	jump_f3313:
		dec    %eax
	jump_f3314:
		test   %eax,%eax
		jge    jump_f3300
		inc    %edx
		cmp    $0x4,%edx
		jl     jump_f32f9
		mov    $0x1,%esi
		cmp    $0x10,%ebx
		jge    jump_f332a
		xor    %esi,%esi
	jump_f332a:
		xor    %edx,%edx
	jump_f332c:
		movzbl data_1e5f7a(%edx),%ecx
		movzbl data_1e5f76(%edx),%eax
		and    %eax,%ecx
		movzbl data_1e5f10(%edx),%ebx
		and    %ebx,%eax
		cmp    %eax,%ecx
		je     jump_f334b
		xor    %esi,%esi
	jump_f334b:
		inc    %edx
		cmp    $0x4,%edx
		jl     jump_f332c
		mov    %esi,%eax
	jump_f3353:
		add    $0x4,%esp
		pop    %esi
		pop    %ecx
		pop    %ebx
		ret


/*----------------------------------------------------------------*/
func_f33f9:
/*----------------------------------------------------------------*/
		push   $0x10
		call   ____CHK
		push   %ebx
		push   %edx
		sub    $0x4,%esp
		xor    %ebx,%ebx
		xor    %edx,%edx
		xor    %eax,%eax
		call   func_f2eb6
		mov    %eax,(%esp)
		test   %eax,%eax
		je     jump_f3427
		mov    (%esp),%eax
		mov    %ax,data_1e5f1a
		xor    %eax,%eax
		jmp    jump_f342c
	jump_f3427:
		mov    $0x1,%eax
	jump_f342c:
		add    $0x4,%esp
		pop    %edx
		pop    %ebx
		ret


/*----------------------------------------------------------------*/
func_f3432:
/*----------------------------------------------------------------*/
		push   $0x8
		call   ____CHK
		push   %ebx
		cwtl
		mov    %edx,%ebx
		mov    %eax,%edx
		mov    $0xffff8003,%eax
		call   func_f2eb6
		mov    %eax,%edx
		test   %eax,%eax
		je     jump_f345c
		mov    %ax,data_1e5f1a
		xor    %eax,%eax
		pop    %ebx
		ret
	jump_f345c:
		mov    $0x1,%eax
		pop    %ebx
		ret


/*----------------------------------------------------------------*/
func_f3463:
/*----------------------------------------------------------------*/
		push   $0xc
		call   ____CHK
		push   %ebx
		push   %edx
		movswl %ax,%edx
		xor    %ebx,%ebx
		mov    $0x2,%eax
		call   func_f2eb6
		mov    %eax,%edx
		movl   $0x1,data_158d9e
		test   %eax,%eax
		je     jump_f3499
		mov    %ax,data_1e5f1a
		xor    %eax,%eax
		pop    %edx
		pop    %ebx
		ret
	jump_f3499:
		mov    $0x1,%eax
		pop    %edx
		pop    %ebx
		ret


/*----------------------------------------------------------------*/
func_f34a1:
/*----------------------------------------------------------------*/
		push   $0xc
		call   ____CHK
		push   %ebx
		push   %edx
		movswl %ax,%edx
		xor    %ebx,%ebx
		mov    $0x11,%eax
		call   func_f2eb6
		mov    %eax,%edx
		test   %eax,%eax
		je     jump_f34cd
		mov    %ax,data_1e5f1a
		xor    %eax,%eax
		pop    %edx
		pop    %ebx
		ret
	jump_f34cd:
		mov    $0x1,%eax
		pop    %edx
		pop    %ebx
		ret


/*----------------------------------------------------------------*/
func_f34d5:
/*----------------------------------------------------------------*/
		push   $0xc
		call   ____CHK
		push   %ebx
		push   %edx
		movswl %ax,%edx
		xor    %ebx,%ebx
		mov    $0x10,%eax
		call   func_f2eb6
		mov    %eax,%edx
		test   %eax,%eax
		je     jump_f3501
		mov    %ax,data_1e5f1a
		xor    %eax,%eax
		pop    %edx
		pop    %ebx
		ret
	jump_f3501:
		mov    $0x1,%eax
		pop    %edx
		pop    %ebx
		ret


/*----------------------------------------------------------------*/
GLOBAL_FUNC (func_f356b)
/*----------------------------------------------------------------*/
		push   $0x14
		call   ____CHK
		push   %ebx
		push   %ecx
		push   %esi
		sub    $0x4,%esp
		mov    %eax,%esi
		mov    %edx,%ecx
		cmpl   $0x1,data_158d9e
		jne    jump_f358f
	jump_f3588:
		xor    %eax,%eax
		jmp    jump_f3353
	jump_f358f:
		movswl %ax,%edx
		mov    $data_1e5f84,%ebx
		mov    $0xffff8020,%eax
		call   func_f2eb6
		mov    %eax,data_1e5f80
		test   %eax,%eax
		je     jump_f35b8
		mov    data_1e5f80,%ax
		mov    %ax,data_1e5f1a
		jmp    jump_f3588
	jump_f35b8:
		mov    data_1e5f8c,%ax
		mov    %ax,0x1e(%ecx)
		mov    data_1e5f8e,%ax
		mov    %ax,0x20(%ecx)
		mov    data_1e5f90,%ax
		mov    %ax,0x22(%ecx)
		mov    data_1e5f92,%ax
		mov    %ax,0x24(%ecx)
		mov    data_1e5f94,%ax
		mov    %ax,0x26(%ecx)
		mov    data_1e5f96,%ax
		mov    %ax,0x28(%ecx)
		mov    data_1e5f88,%ax
		mov    %ax,0x2a(%ecx)
		xor    %ah,%ah
		cwtl
		test   %eax,%eax
		je     jump_f3610
		movw   $0x8,data_1e5f7e
		jmp    jump_f3619
	jump_f3610:
		movw   $0x0,data_1e5f7e
	jump_f3619:
		cmpw   $0x0,0x2a(%ecx)
		je     jump_f367e
		movswl 0x2a(%ecx),%edx
		and    $0xff00,%edx
		sar    $0x8,%edx
		movzwl 0x2a(%ecx),%eax
		call   func_f324f
		test   %ax,%ax
		jne    jump_f3675
		incw   data_158db2
		movswl data_158db2,%eax
		cmp    $0x64,%eax
		jl     jump_f367e
		movw   $0x8103,data_1e5f1a
		mov    $0x7,%eax
		call   _putch
		mov    $0x7,%eax
		call   _putch
		movswl %si,%eax
		call   func_f3463
		jmp    jump_f367e
	jump_f3675:
		movw   $0x0,data_158db2
	jump_f367e:
		movswl %si,%eax
		movswl data_1e5f08(,%eax,2),%edx
		mov    %edx,0x30(%ecx)
		movzwl data_1e5f8a,%edx
		mov    %edx,0x34(%ecx)
		mov    0x34(%ecx),%dx
		mov    %dx,data_1e5f08(,%eax,2)
		mov    0x34(%ecx),%edx
		mov    %edx,(%esp)
		notl   (%esp)
		mov    0x30(%ecx),%edx
		and    (%esp),%edx
		mov    %edx,0x3c(%ecx)
		mov    0x30(%ecx),%edx
		mov    %edx,(%esp)
		notl   (%esp)
		mov    0x34(%ecx),%edx
		and    (%esp),%edx
		mov    %edx,0x38(%ecx)
		cmpw   $0x0,data_1e5f08(,%eax,2)
		je     jump_f36d8
		orb    $0x1,data_1e5f7e
	jump_f36d8:
		cmpl   $0x0,0x38(%ecx)
		je     jump_f36e5
		orb    $0x2,data_1e5f7e
	jump_f36e5:
		cmpl   $0x0,0x3c(%ecx)
		je     jump_f36f2
		orb    $0x4,data_1e5f7e
	jump_f36f2:
		mov    data_1e5f7e,%ax
		jmp    jump_f3353


jump_f38b9:
		push   $0xc
		call   ____CHK
		push   %ebx
		push   %edx
		movswl %ax,%ebx
		mov    %ebx,%eax
		call   func_f34d5
		movswl %ax,%edx
		test   %edx,%edx
		je     jump_f38f8
		mov    %ebx,%eax
		call   func_f3463
		movswl %ax,%edx
		test   %edx,%edx
		je     jump_f38f8
		call   func_f33f9
		movswl %ax,%edx
		test   %edx,%edx
		je     jump_f38f8
		mov    $0x1,%eax
		pop    %edx
		pop    %ebx
		ret
	jump_f38f8:
		mov    %dx,data_1e5f1a
		xor    %eax,%eax
		pop    %edx
		pop    %ebx
		ret

.section .rodata

data_158b5c:
		.string "GRIP.GLL"
		.ascii  "\x00\x00\x00"
data_158b68:
		.string "GRIP"
		.ascii  "\x00\x00\x00"
data_158b70:
		.string "C:\\GRIP\\"
		.ascii  "\x00\x00\x00\x50\x01\x00\x00\x40"
		.ascii  "\x00\x00\x00\x20\x03\x00\x00\x00"
		.ascii  "\x04\x00\x00\x20\x05\x00\x00\x80"
		.ascii  "\x03\x00\x00\x20\x02\x00\x00\x70"
		.ascii  "\x00\x00\x00\xc3\x00\x00\x00\xc5"
		.ascii  "\x00\x00\x00\xb9\x00\x00\x00\xb6"
		.ascii  "\x00\x00\x00\xc3\x00\x00\x00\xb8"
		.ascii  "\x00\x00\x00\xc3\x00\x00\x00\xb8"
		.ascii  "\x00\x00\x00"
data_158bbc:
		.ascii  "\xb5\x00\x00\x00"
data_158bc0:
		.ascii  "\xb6\x00\x00\x00\xb9\x00\x00\x00"
		.ascii  "\xc3\x00\x00\x00\xc4\x00\x00\x00"
		.ascii  "\xc5\x00\x00\x00\xc2\x00\x00\x00"
		.ascii  "\xb0\x00\x00\x00\xb5\x00\x00\x00"
		.ascii  "\xb4\x00\x00\x00\xb6\x00\x00\x00"
		.ascii  "\xb8\x00\x00\x00\xc4\x00\x00\x00"
		.ascii  "\xb0\x00\x00\x00\xb6\x00\x00\x00"
		.ascii  "\xb1\x00\x00\x00\xc4\x00\x00\x00"
		.ascii  "\xb7\x00\x00\x00\xc6\x00\x00\x00"
		.ascii  "\xb5\x00\x00\x00\xb0\x00\x00\x00"
		.ascii  "\xc5\x00\x00\x00\xb4\x00\x00\x00"
		.ascii  "\xb6\x00\x00\x00\xb9\x00\x00\x00"
		.ascii  "\xc3\x00\x00\x00\xc6\x00\x00\x00"
		.ascii  "\xb9\x00\x00\x00\xb0\x00\x00\x00"
		.ascii  "\xc3\x00\x00\x00\xb7\x00\x00\x00"
		.ascii  "\xb8\x00\x00\x00\xc4\x00\x00\x00"
		.ascii  "\xc4\x00\x00\x00\xb3\x00\x00\x00"
		.ascii  "\xc1\x00\x00\x00\xb2\x00\x00\x00"
		.ascii  "\xb4\x00\x00\x00\xb4\x00\x00\x00"
		.ascii  "\xc2\x00\x00\x00\xc4\x00\x00\x00"
		.ascii  "\xc3\x00\x00\x00\xc2\x00\x00\x00"
		.ascii  "\xb6\x00\x00\x00\xc1\x00\x00\x00"
		.ascii  "\xc5\x00\x00\x00\xc3\x00\x00\x00"
		.ascii  "\xb9\x00\x00\x00\xc6\x00\x00\x00"
		.ascii  "\xc4\x00\x00\x00\xc6\x00\x00\x00"
		.ascii  "\xb5\x00\x00\x00\xc3\x00\x00\x00"
		.ascii  "\xb9\x00\x00\x00\xb7\x00\x00\x00"
		.ascii  "\xc3\x00\x00\x00\xc3\x00\x00\x00"
		.ascii  "\xc1\x00\x00\x00\xb9\x00\x00\x00"
		.ascii  "\xc6\x00\x00\x00\xc4\x00\x00\x00"
		.ascii  "\xc1\x00\x00\x00\xc5\x00\x00\x00"
		.ascii  "\xc1\x00\x00\x00"
data_158cbc:
		.ascii  "\xb9\x00\x00\x00"
data_158cc0:
		.ascii  "\xb2\x00\x00\x00\xb1\x00\x00\x00"
		.ascii  "\xb5\x00\x00\x00\xc3\x00\x00\x00"
		.ascii  "\xc4\x00\x00\x00\xb9\x00\x00\x00"
		.ascii  "\xb6\x00\x00\x00\xb7\x00\x00\x00"
		.ascii  "\xb9\x00\x00\x00\xb3\x00\x00\x00"
		.ascii  "\xb0\x00\x00\x00\xc6\x00\x00\x00"
		.ascii  "\xb8\x00\x00\x00\xb1\x00\x00\x00"
		.ascii  "\xb4\x00\x00\x00\xc3\x00\x00\x00"
		.ascii  "\xc6\x00\x00\x00\xb6\x00\x00\x00"
		.ascii  "\xb1\x00\x00\x00\xc3\x00\x00\x00"
		.ascii  "\xc1\x00\x00\x00\xb7\x00\x00\x00"
		.ascii  "\xb3\x00\x00\x00\xb0\x00\x00\x00"
		.ascii  "\xb9\x00\x00\x00\xb9\x00\x00\x00"
		.ascii  "\xb2\x00\x00\x00\xb2\x00\x00\x00"
		.ascii  "\xb1\x00\x00\x00\xb3\x00\x00\x00"
		.ascii  "\xc3\x00\x00\x00\xb8\x00\x00\x00"
		.ascii  "\xc2\x00\x00\x00\xb2\x00\x00\x00"
		.ascii  "\xb5\x00\x00\x00\xb5\x00\x00\x00"
		.ascii  "\xb8\x00\x00\x00\xc1\x00\x00\x00"
		.ascii  "\xb2\x00\x00\x00\xc6\x00\x00\x00"
		.ascii  "\xb2\x00\x00\x00\xb3\x00\x00\x00"
		.ascii  "\xc4\x00\x00\x00\xb8\x00\x00\x00"
		.ascii  "\xb3\x00\x00\x00\xb4\x00\x00\x00"
		.ascii  "\xb2\x00\x00\x00\xb3\x00\x00\x00"
		.ascii  "\xb9\x00\x00\x00\xb7\x00\x00\x00"
		.ascii  "\xc3\x00\x00\x00\xc4\x00\x00\x00"
		.ascii  "\xc1\x00\x00\x00\xb5\x00\x00\x00"
		.ascii  "\xc1\x00\x00\x00"
data_158d9c:
		.short  0x0
data_158d9e:
		.long	0x0
data_158da2:
		.long   data_15f1b0
data_158da6:
		.fill   0x6
data_158dac:
		.short  0x0
data_158dae:
		.ascii  "\x01\x00\x00\x00"
data_158db2:
		.fill   0xc
data_158dbe:
		.long	0x0
data_158dc2:
		.long	0x0
data_158dc6:
		.long	0x0
data_158dca:
		.long	0x0
data_158dce:
		.long	0x0
data_158dd2:
		.fill   0x6

data_15ed1c:
		.string "PATH"
data_15ed21:
		.string "rb"

data_15f1b0:
		.string "(C) 1994 Spacetec IMC Corporation.  All rights reserved.  The computer codes included in this file, including source code and object code, constitutes the proprietary and confidential information of Spacetec IMC Corporation and are provided pursuant to a license agreement. These computer codes are protected by international, federal and state law, including United States Copyright Law and international treaty provisions.  Except as expressly authorized by the license agreement, or as expressly permitted under applicable laws of member states of the European Union and then only to the extent so permitted, no part of these computer codes may be reproduced or transmitted in any form or by any means, electronic or mechanical, modified, decompiled, disassembled, reverse engineered, sold, transferred, rented or utilized for any unauthorized purpose without the express written permission of Spacetec IMC Corporation."
data_15f54b:
		.string "SpaceWare(R) Spaceball(R)"

GLOBAL (data_1e2f35)
		.byte	0x0
GLOBAL (data_1e2f36)
		.byte	0x0
GLOBAL (data_1e2f37)
		.byte	0x0

data_1e5eef:
		.ascii  "\x00\x00\x00"
data_1e5ef2:
		.long	0x0
data_1e5ef6:
		.short  0x0
GLOBAL (data_1e5ef8)
		.long	0x0
data_1e5efc:
		.long	0x0
data_1e5f00:
		.long	0x0
data_1e5f04:
		.short  0x0
data_1e5f06:
		.short  0x0
data_1e5f08:
		.fill   0x8
data_1e5f10:
		.long	0x0
data_1e5f14:
		.long	0x0
data_1e5f18:
		.short  0x0
data_1e5f1a:
		.short  0x0
data_1e5f1c:
		.fill   0xc
data_1e5f28:
		.long	0x0
data_1e5f2c:
		.byte	0x0
data_1e5f2d:
		.ascii  "\x00\x00\x00"
data_1e5f30:
		.fill   0xc
data_1e5f3c:
		.fill   0x8
data_1e5f44:
		.fill   0x10
data_1e5f54:
		.long	0x0
data_1e5f58:
		.fill   0x8
data_1e5f60:
		.fill   0x6
data_1e5f66:
		.fill   0x10
data_1e5f76:
		.long	0x0
data_1e5f7a:
		.long	0x0
data_1e5f7e:
		.short  0x0
data_1e5f80:
		.long	0x0
data_1e5f84:
		.long	0x0
data_1e5f88:
		.short  0x0
data_1e5f8a:
		.short  0x0
data_1e5f8c:
		.short  0x0
data_1e5f8e:
		.short  0x0
data_1e5f90:
		.short  0x0
data_1e5f92:
		.short  0x0
data_1e5f94:
		.short  0x0
data_1e5f96:
		.fill   0x92