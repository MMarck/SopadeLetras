#script para converit una sopa de letras dispersa en la declaracion de un array en assembly

a="""S	L	K	F	M	B	C	U	L	K	V	Y	U	I	M
T	W	C	D	Q	F	Y	I	V	I	K	U	X	K	B
G	N	I	W	E	Q	B	O	S	Y	E	M	D	T	J
W	D	H	F	Z	Z	P	U	I	E	D	E	R	Y	Q
K	M	T	G	T	K	A	K	R	O	M	U	S	U	V
B	E	L	B	L	L	T	U	V	J	Q	H	C	R	W
U	P	L	U	B	Y	J	K	N	U	X	O	R	L	F
S	G	M	A	O	O	E	E	N	B	O	G	I	W	R
J	V	S	T	L	P	T	E	G	P	P	N	P	J	W
Y	I	N	C	A	S	S	E	M	B	L	Y	T	T	U
C	H	W	T	I	O	I	W	O	R	D	Z	D	R	V
B	R	Z	C	N	R	A	V	R	W	A	M	U	N	U
K	O	M	C	O	U	K	N	G	Q	E	P	Q	V	S
X	X	R	X	J	U	J	U	B	E	X	V	G	G	A
M	N	K	J	Q	K	Z	A	A	C	V	C	L	D	W"""


a = a.replace('	',"")
aList = a.split('\n')
result =""
for line in aList:
    result += "db '"+ line + "'\n"

print(result)
