using CellFreeModelGenerationKit

# path to test metabolism file -
path_to_test_metabolism_file = "./test/data/Test.vff"

# need to build a model object -
build_result = build_julia_model_object(path_to_test_metabolism_file,"blank_for_now")
if (isa(build_result.value, Exception) == true)
    @show build_result.value
end
julia_model_object = build_result.value

# parse -
result = parse_vff_model_document(julia_model_object)
if (isa(result.value,Exception) == true)
    @show result.value
end
ir_dictionary = result.value

# look at the reaction table?
rxn_table = ir_dictionary[ir_master_reaction_table_key]
met_symbol_array = ir_dictionary[ir_list_of_molecular_species_key]
rxn_tag_array = ir_dictionary[ir_list_of_reaction_tags_key]