/* MAP -- the reserved map-data member of the retail link (rom/DIABPSX.MAP: __MAP_data_obj = __MAP_data_objend =
 * 0x800B0320, __MAP_data_size = 0).  The object has one section, an empty .data, and is the only member of the
 * PSYLINK overlay group map_data, linked over startup_text at 0x800B031C; PSYLINK records that group as SYM overlay
 * id 5 (length 4: its own `$map_data` id word).  No code, no data, no SYM source records belong to it. */
	.data
