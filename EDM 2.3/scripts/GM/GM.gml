function pick(val1,val2,condition) {

	if condition
	return val2;
	else
	return val1;
	}
	
function array_swap_index(arr,currInd,destInd) {
	
	if (currInd == destInd)
	return false;
	
	var currentValue = arr[currInd]
	var destValue = arr[destInd];
	
	arr[@ currInd] = destValue;
	arr[@ destInd] = currentValue;
	
	return true;
	}
	
function filename_name_ext(path,includeExt=true) {
	
	var fname = filename_name(path);
	
	if includeExt
	return fname;
	
	// return without extension
	var ext = filename_ext(path);
	var fname_length = string_length(fname);
	var ext_length = string_length(ext);
	
	fname = string_delete(fname,fname_length-ext_length+1,ext_length);
	
	return fname;
	}

function toggle(value) {
	
	return bool(!value);
	}

function deep_copy(_source) {
	
    if (is_struct(_source)) {
        // create a copy of a struct, with all nested structs/arrays also copied
        var _keys = variable_struct_get_names(_source);
        var _length = array_length(_keys);
        var _result = {};
        for (var i = 0; i < _length; i++) {
            var _value = deep_copy(variable_struct_get(_source, _keys[i]));
            variable_struct_set(_result, _keys[i], _value);
        }
        return _result;
    } else if (is_array(_source)) {
        // create a copy of an array, with all nested structs/arrays also copied
        var _length = array_length(_source);
        var _result = array_create(_length);
        for (var i = 0; i < _length; i++) {
            _result[i] = deep_copy(_source[i]);
        }
        return _result;
    } else {
        // if not a struct or an array, just return the simple value
        return _source;
    }
}
	
function json_are_equal(a, b) {
	
    var type = typeof(a);
    if (type != typeof(b)) return false;
    switch (type) {
        case "array":
            var n = array_length(a);
            if (n != array_length(b)) return false;
            for (var i = 0; i < n; ++i) {
                if (!json_are_equal(a[i], b[i])) return false;
            }
        break;
		
        case "struct":
            var ks = variable_struct_get_names(a);
            var n = array_length(ks);
            var ksb = variable_struct_get_names(b);
            if (n != array_length(ksb)) return false;
            for (var i = 0; i < n; ++i) {
                var k = ks[i];
                if (!(variable_struct_exists(b, k) && json_are_equal(a[$ k], b[$ k]))) return false;
            }
        break;
        default:
            if (a != b) return false;
    }
	
    return true;
	}	
	
function array_sort_struct(source_array,key,ascending,nestedFolder=[]) {
	
	// create temp sorting grid
	var sorting_grid = ds_grid_create(2,0);

	// add data to grid
	var size = array_length(source_array);
	for(var i=0;i<size;i++) {
		
		var pointer = source_array[i];
		
		for(var j=0;j<array_length(nestedFolder);j++) {

			var nestName = nestedFolder[j];
			pointer = pointer[$ nestName];
			}
		
		var sort_value = pointer[$ key];
		
		if is_string(sort_value)
		sort_value = string_lower(sort_value);

		// debug
		if (sort_value == undefined) {
			
			ds_grid_destroy(sorting_grid);
			sm("score key '"+key+"' undefined >> not sorted");
			exit;
			}

		grid_row_add(sorting_grid); // add a row to the temp sorting grid
		sorting_grid[# 0,i] = source_array[i]; // add list pointer to grid
		sorting_grid[# 1,i] = sort_value; // add value to sort to grid
		}
	
	// sort grid
	ds_grid_sort(sorting_grid,1,ascending); 

	// re add pointers back to the source array
	for(var i=0;i<size;i++)
	source_array[@ i] = sorting_grid[# 0,i];

	// destroy temp sorting grid
	ds_grid_destroy(sorting_grid);
	}
	
function get_files_in_directory(filepath,attr=0) {
	
	var directory = filename_path(filepath);
	var first = file_find_first(directory+"/*.png",attr);
	
	var arr = [directory+first];
	
	// find the rest in the directory
	while true
		{
		var fname = file_find_next();
		
		if (fname == "")
		break;
		
		array_push(arr,directory+fname);
		}
	
	file_find_close();
	
	return arr;
	}
	
function add_string(str,value,_min=undefined,_max=undefined) {
	
	str = real(str);
	str += value;
	
	_min = pick(_min,str,_min==undefined);
	_max = pick(_max,str,_max==undefined);
	
	str = clamp(str,_min,_max);
	
	return string(str);
	}
	
function round_tenth(n) {

	n *= 10;
	n = round(n);
	n /= 10;

	return real(n);
	}
