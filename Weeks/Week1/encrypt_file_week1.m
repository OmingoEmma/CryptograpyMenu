function encrypt_file_week1(input_file, output_file)
    % Read file contents
    if exist(input_file, 'file') ~= 2
        error('File not found: %s', input_file);
    end

    fid = fopen(input_file, 'r');
    file_data = fread(fid, '*char')'; % Read file as characters
    fclose(fid);

    % Encrypt using the Caesar cipher function
    encrypted_data = encrypt_week1(file_data);

    % Write encrypted data to output file
    fid = fopen(output_file, 'w');
    fwrite(fid, encrypted_data);
    fclose(fid);

    fprintf('File successfully encrypted and saved as: %s\n', output_file);
end
