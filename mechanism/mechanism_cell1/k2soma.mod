TITLE Potasium Type K2 current for RD Traub, J Neurophysiol 89:909-921, 2003

COMMENT

	Implemented by Maciej Lazarewicz 2003 (mlazarew@seas.upenn.edu)

ENDCOMMENT

INDEPENDENT { t FROM 0 TO 1 WITH 1 (ms) }

UNITS { 
	(mV) = (millivolt) 
	(mA) = (milliamp) 
} 
NEURON { 
	SUFFIX k2soma
	USEION k READ ek WRITE ik
	RANGE gbar, ik
	RANGE v1, v2, v3, v4, v5, v6
}
PARAMETER { 
	gbar  	(mho/cm2)
	v ek 		(mV)  
	v1 = 58 (mV)
	v2 = 10.6 (mV)
	v3 = 1.33 (mV)
	v4 = 200 (mV) 
	v5 = 130 (mV)
	v6 = 7.1 (mV)
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
	ik = gbar * m * h * ( v - ek ) 
} 
INITIAL { 
	settables(v) 
	m  = minf
	m  = 0
	h  = hinf
} 
DERIVATIVE states { 
	:settables(v)  
	
	minf  = 1 / ( 1 + exp( ( - v - 10 ) / 17 ) )
	mtau  = 4.95 + 0.5 / ( exp( ( v - 81 ) / 25.6 ) + exp( ( - v - 132 ) / 18 ) )
	hinf  = 1 / ( 1 + exp( ( v + v1 ) / v2 ) )
	htau  = 60 + 0.5 / ( exp( ( v - v3 ) / v4 ) + exp( ( - v - v5 ) / v6 ) )
	
	m' = ( minf - m ) / mtau 
	h' = ( hinf - h ) / htau
}

UNITSOFF 

PROCEDURE settables(v) { 
	TABLE minf, hinf, mtau, htau  FROM -120 TO 40 WITH 641

	minf  = 1 / ( 1 + exp( ( - v - 10 ) / 17 ) )
	mtau  = 4.95 + 0.5 / ( exp( ( v - 81 ) / 25.6 ) + exp( ( - v - 132 ) / 18 ) )
	hinf  = 1 / ( 1 + exp( ( v + 58 ) / 10.6 ) )
	htau  = 60 + 0.5 / ( exp( ( v - 1.33 ) / 200 ) + exp( ( - v - 130 ) / 7.1 ) )
}

UNITSON