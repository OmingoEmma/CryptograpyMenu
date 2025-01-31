function decrypt_file_week1(input_file, output_file)
    % Read file contents
    if exist(input_file, 'file') ~= 2
        error('File not found: %s', input_file);
    end

    fid = fopen(input_file, 'r');
    encrypted_data = fread(fid, '*char')'; % Read encrypted data
    fclose(fid);

    % Decrypt using the Caesar cipher function
    decrypted_data = decrypt_week1(encrypted_data);

    % Write decrypted data to output file
    fid = fopen(output_file, 'w');
    fwrite(fid, decrypted_data);
    fclose(fid);

    fprintf('File successfully decrypted and saved as: %s\n', output_file);
end
