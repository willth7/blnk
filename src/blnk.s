;   Copyright 2022 Will Thomas
;
;   Licensed under the Apache License, Version 2.0 (the "License");
;   you may not use this file except in compliance with the License.
;   You may obtain a copy of the License at
;
;       http://www.apache.org/licenses/LICENSE-2.0
;
;   Unless required by applicable law or agreed to in writing, software
;   distributed under the License is distributed on an "AS IS" BASIS,
;   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;   See the License for the specific language governing permissions and
;   limitations under the License.

.global	blnk
	.type	blnk, @function

_cnt:
	subi r24, 1
	sbci r25, 0
	sbci r26, 0
	ldi r23, 0
	cp r24, r23
	cpc r25, r23
	cpc r26, r23
	brne _cnt
	ret
	
_mil:
	ldi r24, 64
	ldi r25, 66
	ldi r26, 15
	ret
	
_qmil:
	ldi r24, 144
	ldi r25, 208
	ldi r26, 3
	ret
	
_0:
	call _mil
	call _cnt
	sbi 0x05, 5
	call _qmil
	call _cnt
	cbi 0x05, 5
	call _qmil
	call _cnt
	sbi 0x05, 5
	call _qmil
	call _cnt
	cbi 0x05, 5
	call _qmil
	call _cnt
	ret
	
_1:
	call _mil
	call _cnt
	sbi 0x05, 5
	call _mil
	call _cnt
	cbi 0x05, 5
	ret
	
_b:
	and r24, r25
	breq _0
	brne _1
	ret
	
blnk:
	std y+1, r24
	ldi r25, 128
	call _b
	ldd r24, y+1
	ldi r25, 64
	call _b
	ldd r24, y+1
	ldi r25, 32
	call _b
	ldd r24, y+1
	ldi r25, 16
	call _b
	ldd r24, y+1
	ldi r25, 8
	call _b
	ldd r24, y+1
	ldi r25, 4
	call _b
	ldd r24, y+1
	ldi r25, 2
	call _b
	ldd r24, y+1
	ldi r25, 1
	call _b
	ret
