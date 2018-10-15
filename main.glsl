float xcount = 30.0;
float ycount = 20.0;

// helper fxns
float map(float value, float min1, float max1, float min2, float max2) { 
	return ((value - min1) / (max1 - min1)) * (max2 - min2) + min2;
}

// main
vec4 renderMain(void) {

	vec3 color = vec3(0.0);

	// break into rows first, then do columns within
	vec2 location_index = vec2( floor(_uv.x * xcount), floor( (1.0 - _uv.y) * ycount ) );
	location_index++; // start indices at 1 for easier brain thinking

	if ( location_index.y < 6.5 ) { 		// sound levels	:	
		float sub_uv_y = map(_uv.y, 1.0 - (6.0 / 20.0), 1.0, 0.0, 1.0);
		if (location_index.x < 2.5 ) {			// syn_BassLevel
			if (syn_BassLevel > sub_uv_y ) color = vec3(1.0, 0.0, 0.0);
		} else if (location_index.x < 4.5 ) {	// syn_BassHits
			if (syn_BassHits > sub_uv_y ) color = vec3(0.0, 1.0, 0.0);
		} else if (location_index.x < 6.5 ) {	// syn_BassPresence
			if (syn_BassPresence > sub_uv_y ) color = vec3(0.0, 0.0, 1.0);
		} else if (location_index.x < 8.5 ) {	// syn_MidLevel
			if (syn_MidLevel > sub_uv_y ) color = vec3(1.0, 0.0, 0.0);
		} else if (location_index.x < 10.5 ) {	// syn_MidHits
			if (syn_MidHits > sub_uv_y ) color = vec3(0.0, 1.0, 0.0);
		} else if (location_index.x < 12.5 ) {	// syn_MidPresence 
			if (syn_MidPresence > sub_uv_y ) color = vec3(0.0, 0.0,1.0);
		} else if (location_index.x < 14.5 ) {	// syn_MidHighLevel
			if (syn_MidHighLevel > sub_uv_y ) color = vec3(1.0, 0.0, 0.0);
		} else if (location_index.x < 16.5 ) {	// syn_MidHighHits
			if (syn_MidHighHits > sub_uv_y ) color = vec3(0.0, 1.0, 0.0);
		} else if (location_index.x < 18.5 ) {	// syn_MidHighPresence 
			if (syn_MidHighPresence > sub_uv_y ) color = vec3(0.0, 0.0, 1.0);
		} else if (location_index.x < 20.5 ) {	// syn_HighLevel
			if (syn_HighLevel > sub_uv_y ) color = vec3(1.0, 0.0, 0.0);
		} else if (location_index.x < 22.5 ) {	// syn_HighHits
			if (syn_HighHits > sub_uv_y ) color = vec3(0.0, 1.0, 0.0);
		} else if (location_index.x < 24.5 ) {	// syn_HighPresence 
			if (syn_HighPresence > sub_uv_y ) color = vec3(0.0, 0.0, 1.0);
		} else if (location_index.x < 26.5 ) {	// syn_Level
			if (syn_Level > sub_uv_y ) color = vec3(1.0, 0.0, 0.0);
		} else if (location_index.x < 28.5 ) {	// syn_Hits
			if (syn_Hits > sub_uv_y ) color = vec3(0.0, 1.0, 0.0);
		} else {								// syn_Presence 
			if (syn_Presence > sub_uv_y ) color = vec3(0.0, 0.0, 1.0);
		}
	} else if ( location_index.y < 7.5 ) {	// syn_BassTime
		if (mod(syn_BassTime * time_scale, 1920.0) > _xy.x ) color = vec3(0.5, 0.0, 0.9);
	} else if ( location_index.y < 8.5 ) {	// syn_MidTime
		if (mod(syn_MidTime * time_scale, 1920.0) > _xy.x ) color = vec3(0.0, 0.0, 1.0);
	} else if ( location_index.y < 9.5 ) {	// syn_MidHighTime
		if (mod(syn_MidHighTime * time_scale, 1920.0) > _xy.x ) color = vec3(0.0, 0.5, 0.9);
	} else if ( location_index.y < 10.5 ) {	// syn_HighTime
		if (mod(syn_HighTime * time_scale, 1920.0) > _xy.x ) color = vec3(0.0, 0.9, 0.0);
	} else if ( location_index.y < 11.5 ) {	// syn_Time
		if (mod(syn_Time * time_scale, 1920.0) > _xy.x ) color = vec3(0.9, 0.9, 0.2);
	} else if ( location_index.y < 12.5 ) {	// syn_CurvedTime
		if (mod(syn_CurvedTime * time_scale, 1920.0) > _xy.x ) color = vec3(0.9, 0.4, 0.0);
	} else if ( location_index.y < 13.5 ) {	// TIME
		if (mod(TIME * time_scale, 1920.0) > _xy.x ) color = vec3(1.0, 0.0, 0.0);
	} else if ( location_index.y < 18.5 ) {	// bpm and beats :
		float sub_uv_y = map(_uv.y, 1.0 - (18.0 / 20.0), 1.0 - (13.0 / 20.0), 0.0, 1.0);
		if (location_index.x < 1.5) {			// syn_BPMConfidence
			if (syn_BPMConfidence > sub_uv_y ) color = vec3(1.0);
		} else if (location_index.x < 6.5) {	// syn_BPM
			float normalized_bpm = map(syn_BPM, 50.0, 220.0, 0.0, 1.0);
			if (normalized_bpm > sub_uv_y ) color = vec3(1.0);
		} else if (location_index.x < 9.5) {	// syn_OnBeat
			if (syn_OnBeat > sub_uv_y ) color = vec3(1.0);
		} else if (location_index.x < 12.5) {	// syn_ToggleOnBeat
			if (syn_ToggleOnBeat > sub_uv_y ) color = vec3(1.0);
		} else if (location_index.x < 15.5) {	// syn_RandomOnBeat
			if (syn_RandomOnBeat > sub_uv_y ) color = vec3(1.0);
		} else if (location_index.x < 18.5) {	// syn_BPMSin
			if (syn_BPMSin > sub_uv_y ) color = vec3(1.0);
		} else if (location_index.x < 21.5) {	// syn_BPMTri
			if (syn_BPMTri > sub_uv_y ) color = vec3(1.0);
		} else if (location_index.x < 24.5) {	// syn_BPMSin2
			if (syn_BPMSin2 > sub_uv_y ) color = vec3(1.0);
		} else if (location_index.x < 27.5) {	// syn_BPMTri2
			if (syn_BPMTri2 > sub_uv_y ) color = vec3(1.0);
		} else {								// syn_BPMSin4
			if (syn_BPMSin4 > sub_uv_y ) color = vec3(1.0);
		}
	} else if ( location_index.y < 19.5 ) {	// syn_BeatTime
		if (mod(syn_BeatTime * time_scale, 1920.0) > _xy.x ) color = vec3(0.75);
	} else {								// syn_BPMTwitcher
		if (mod(syn_BPMTwitcher * time_scale, 1920.0) > _xy.x ) color = vec3(0.5);	
	}
	vec4 labels = texture(uniforms_labels, _uv);
	vec4 variables = texture(uniforms_variables, _uv);
	if (show_labels > 0.5) {
		color = mix(labels.xyz, color, 1.0 - labels.a * label_opacity);
	} else if (show_variables > 0.5) { 
		color = mix(variables.xyz, color, 1.0 - variables.a * label_opacity);
	} 
	return vec4(color, 1.0); 
}