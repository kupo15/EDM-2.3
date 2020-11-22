function ds_stack_new_create() {
	
return ds_list_create();	
}

function ds_stack_new_destroy(stackId) {
	
ds_list_destroy(stackId);
}

function ds_stack_new_push(stackId,val) {
	
ds_list_add(stackId,val);
}

function ds_stack_new_pop(stackId) {
	
var size = ds_list_size(stackId);
var return_val = ds_list_find_value(stackId,size-1);

ds_list_delete(stackId,size-1);

return return_val;
}

function ds_stack_new_size(stackId) {
	
return ds_list_size(stackId);	
}

function ds_stack_new_clear(stackId) {
ds_list_clear(stackId);
	
}

function ds_stack_new_copy(stackId) {
	
var copy = ds_list_create();
return ds_list_copy(copy,stackId);
}

function ds_stack_new_empty(stackId) {
	
return ds_list_empty(stackId);	
}

function ds_stack_new_get(stackId,pos) {
// get value at position	

return ds_list_find_value(stackId,pos);
}

