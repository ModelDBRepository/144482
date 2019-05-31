TITLE Potasium Type A current for RD Traub, J Neurophysiol 89:909-921, 2003

COMMENT

	Implemented by Maciej Lazarewicz 2003 (mlazarew@seas.upenn.edu)

ENDCOMMENT

INDEPENDENT { t FROM 0 TO 1 WITH 1 (ms) }

UNITS { 
	(mV) = (millivolt) 
	(mA) = (milliamp) 
} 
NEURON { 
	SUFFIX kasoma
	USEION k READ ek WRITE ik
	RANGE gbar, ik
	RANGE v1, v2, v3, v4, v5, v6, v7
}
PARAMETER { 
	gbar = 0.0 	(mho/cm2)
	v ek 		(mV)  
	v1 = 78 (mV)
	v2 = 6 (mV)
	v3 = -63 (mV)
	v4 = 46 (mV)
	v5 = 5 (mV)
	v6 = 238  (mV)
	v7 = 37.5 (mV)
	
} 
ASSIGNED { 
	ik 		(mA/cm2) 
	minf hinf 	(1)
	mtau htau 	(ms) 
} 
STATE {
	m h
}
BREAKPOINT { 
	SOLVE states METHOD cnexp
	ik = gbar * m * m * m * m * h * ( v - ek ) 
} 
INITIAL { 
	settables(v) 
	m  = minf
	m  = 0
	h  = hinf
} 
DERIVATIVE states { 
	:settables(v) 
	
	minf  = 1 / ( 1 + exp( ( - v - 60 ) / 8.5 ) )
	mtau = 0.185 + 0.5 / ( exp( ( v + 35.8 ) / 19.7 ) + exp( ( - v - 79.7 ) / 12.7 ) )
	hinf  = 1 / ( 1 + exp( ( v + v1 ) / v2 ) )
	:if( v < v3 ) {
		htau = 0.5 / ( exp( ( v + v4 ) / v5 ) + exp( ( - v - v6 ) / v7 ) )
	:}else{
		htau = 9.5
	:}
	
	
	
	m' = ( minf - m ) / mtau 
	h' = ( hinf - h ) / htau
}

UNITSOFF 

PROCEDURE settables(v) { 
	TABLE minf, hinf, mtau, htau  FROM -120 TO 40 WITH 641

	minf  = 1 / ( 1 + exp( ( - v - 60 ) / 8.5 ) )
	mtau = 0.185 + 0.5 / ( exp( ( v + 35.8 ) / 19.7 ) + exp( ( - v - 79.7 ) / 12.7 ) )
	hinf  = 1 / ( 1 + exp( ( v + v1 ) / v2 ) )
	if( v < v3 ) {
		htau = 0.5 / ( exp( ( v + v4 ) / v5 ) + exp( ( - v - v6 ) / v7 ) )
	}else{
		htau = 9.5
	}
}

UNITSON