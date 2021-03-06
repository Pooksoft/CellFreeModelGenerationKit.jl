import Base.+

function +(buffer::Array{String,1},content::String)
    push!(buffer,content)
end

function +(buffer::Array{String,1}, content_array::Array{String,1}; padding::Union{String,Nothing}=nothing)
    for line in content_array
        
        if (padding === nothing)
            push!(buffer, line)
        else
            push!(buffer,"$(padding)$(line)")
        end
    end
end

function contains(string,token)
    return occursin(token,string)
end

function include_function(path_to_src_file::String)::Array{String,1}

    # create src_buffer -
    src_buffer::Array{String,1} = String[]

    # read -
    open(path_to_src_file,"r") do src_file
        for line in eachline(src_file)

            new_line_with_line_ending = line*"\n"
            push!(src_buffer,new_line_with_line_ending)
        end
    end

    # return the raw buffer -
    return src_buffer
end

function include_function(path_to_src_file::String, prefix_pad_string::String)::String

    # create src_buffer -
    src_buffer::Array{String,1} = String[]

    # read -
    open(path_to_src_file,"r") do src_file
        for line in eachline(src_file)

            new_line_with_line_ending = line*"\n"
            push!(src_buffer,new_line_with_line_ending)
        end
    end

    string_value = ""
    for line in src_buffer
        string_value *= prefix_pad_string*line
    end

    return src_buffer
end

function _request_user_input(prompt::String="")::String
    print(prompt)
    return chomp(readline())
end