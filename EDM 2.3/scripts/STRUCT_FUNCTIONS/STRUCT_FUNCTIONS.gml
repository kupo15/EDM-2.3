function struct_copy(_source) {
	
if (is_struct(_source)) 
	{
    // create a copy of a struct, with all nested structs/arrays also copied
    var _keys = variable_struct_get_names(_source);
    var _length = array_length(_keys);
    var _result = {};
    for (var i = 0; i < _length; i++) 
		{
        var _value = struct_copy(variable_struct_get(_source, _keys[i]));
        variable_struct_set(_result, _keys[i], _value);
		}
	
    return _result;
	} 
else if (is_array(_source)) 
	{
    // create a copy of an array, with all nested structs/arrays also copied
    var _length = array_length(_source);
    var _result = array_create(_length);
    for (var i = 0; i < _length; i++) 
		{
        _result[i] = struct_copy(_source[i]);
		}
return _result;
} 
else 
	{
    // if not a struct or an array, just return the simple value
    return _source;
	}
}
	
function copy_deep(thing,source) {
    var copyType = typeof(thing);
    if (copyType != typeof(source)) throw "Trying to copy incompatible types";
    var copySize, thingEntry, sourceEntry, sourceType;
    switch (copyType) {
        case "array":
            copySize = array_length(source);
            array_resize(thing, copySize);
            for (var i = copySize-1; i >= 0; --i) {
                thingEntry = thing[i];
                sourceEntry = source[i];
                sourceType = typeof(sourceEntry);
                if (sourceType == typeof(thingEntry) && (is_array(thingEntry) || is_struct(thingEntry))) {
                    copy_deep(thingEntry, sourceEntry);
                } else {
                    array_set(thing, i, clone_deep(sourceEntry));
                }
            }
        break;
        case "struct":
            // Transfer their keys to mine
            var copyKeys = variable_struct_get_names(source);
            copySize = array_length(copyKeys);
            for (var i = copySize-1; i >= 0; --i) {
                var copyKey = copyKeys[i];
                thingEntry = variable_struct_get(thing, copyKey);
                sourceEntry = variable_struct_get(source, copyKey);
                sourceType = typeof(sourceEntry);
                if (sourceType == typeof(thingEntry) && (is_array(thingEntry) || is_struct(thingEntry))) {
                    copy_deep(thingEntry, sourceEntry);
                } else {
                    variable_struct_set(thing, copyKey, clone_deep(sourceEntry));
                }
            }
            // Set keys that are not theirs to undefined
            var myKeys = variable_struct_get_names(thing);
            var mySize = array_length(myKeys);
            for (var i = mySize-1; i >= 0; --i) {
                var myKey = myKeys[i];
                if (!variable_struct_exists(source, myKey)) {
                    variable_struct_set(thing, myKey, undefined);
                }
            }
        break;
        default:
            return source;
    }
    return thing;
}

function clone_deep(thing) {
    var cloneType = typeof(thing);
    var theClone;
    switch (cloneType) {
        case "array":
            var cloneSize = array_length(thing);
            theClone = array_create(cloneSize);
            for (var i = cloneSize-1; i >= 0; --i) {
                theClone[i] = clone_deep(thing[i]);
            }
        break;
        case "struct":
            var cloneKeys = variable_struct_get_names(thing);
            theClone = {};
            for (var i = array_length(cloneKeys)-1; i >= 0; --i) {
                var cloneKey = cloneKeys[i];
                variable_struct_set(theClone, cloneKey, clone_deep(variable_struct_get(thing, cloneKey)));
            }
        break;
        default:
            return thing;
    }
    return theClone;
}	

function struct_undo_push(workingStruct) {

// add the current pointer to stack
ds_list_push(structUndoStack,workingStruct);
	
// create a copy the current struct
var new_working = struct_copy(workingStruct);	
	
//activeStruct = variable_struct_get(new_working,name);
	
// return the new copy of the root struct
return new_working;
}

function struct_undo_pop(struct,overwrite) {
/// @param workingStruct
/// @param overwrite

var pop = ds_list_pop(structUndoStack); // retrieve previous root copy

if overwrite
pop = struct_copy(struct); // overwrite previous root copy with new changes

return pop; // return previous root copy
}

function struct_undo_peek(showDebug) {
/// @param [showDebug]	
		
var return_val = ds_list_peek(structUndoStack);

if argument[0] == true
	{
	cs(js(return_val));
	sm("");
	}

return return_val;
}
	
function struct_debug_show(struct,message) {
/// @param struct
/// @param [message]

if argument[1] == undefined
message = "";

cs(js(struct));
sm(message);	
}