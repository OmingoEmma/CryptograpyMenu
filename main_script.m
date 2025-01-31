clc; clear; close all;

% Display available encryption methods for each week
disp('============================================');
disp('         Cryptography Methods Menu            ');
disp('============================================');
disp(' 1.  Classic Cipher (Caesar Cipher)');
disp(' 2.  One-Time Pad (OTP)');
disp(' 3.  Bit-wise XOR Cipher');
disp(' 4.  DES Block Cipher');
disp(' 5.  Bit-wise Stream Cipher (RC4)');
disp(' 6.  Hashing (SHA-256, MD5)');
disp(' 7.  Keyed Hash (HMAC)');
disp(' 8.  Authenticated Encryption (AES-GCM)');
disp(' 9.  Performance Metrics & Stats');
disp('10.  RSA Public-Key Encryption');
disp('11.  DH/EC Key Generation');
disp('============================================');

% Prompt user for week number
week_number = input('Enter the week number (1-11) to use: ');

% Construct folder path
week_folder = fullfile('Weeks', ['Week' num2str(week_number)]);

% Check if the folder exists
if ~isfolder(week_folder)
    error('Invalid week selection. Folder does not exist.');
end

% Add the selected week's folder to the MATLAB path
addpath(week_folder);

% Ask user for action: Encrypt or Decrypt
choice = input('Do you want to (1) Encrypt or (2) Decrypt? ', 's');

% Ask user for data type
data_type = input('Do you want to process (1) Text, (2) File, or (3) Image? ', 's');

if choice == "1"  % Encryption
    if data_type == "1"
        % TEXT ENCRYPTION
        user_text = input('Enter the text to encrypt: ', 's');
        encrypt_func = str2func(['encrypt_week' num2str(week_number)]);
        encrypted_data = encrypt_func(user_text);
        disp(['Encrypted Message: ', encrypted_data]);

    elseif data_type == "2"
        % FILE ENCRYPTION
        file_name = input('Enter the filename to encrypt (with extension): ', 's');
        input_path = fullfile('input_files', file_name);
        output_path = fullfile('input_files', ['encrypted_' file_name]);

        encrypt_func = str2func(['encrypt_file_week' num2str(week_number)]);
        encrypt_func(input_path, output_path);
        
    elseif data_type == "3"
        % IMAGE ENCRYPTION
        image_name = input('Enter the image filename (including extension): ', 's');
        input_path = fullfile('input_files', image_name);
        output_path = fullfile('input_files', ['encrypted_' image_name]);

        encrypt_func = str2func(['encrypt_image_week' num2str(week_number)]);
        encrypt_func(input_path, output_path);
    end

elseif choice == "2"  % Decryption
    if data_type == "1"
        % TEXT DECRYPTION
        encrypted_text = input('Enter the encrypted text to decrypt: ', 's');
        decrypt_func = str2func(['decrypt_week' num2str(week_number)]);
        decrypted_data = decrypt_func(encrypted_text);
        disp(['Decrypted Message: ', decrypted_data]);

    elseif data_type == "2"
        % FILE DECRYPTION
        file_name = input('Enter the encrypted filename to decrypt (with extension): ', 's');
        input_path = fullfile('input_files', file_name);
        output_path = fullfile('input_files', ['decrypted_' file_name]);

        decrypt_func = str2func(['decrypt_file_week' num2str(week_number)]);
        decrypt_func(input_path, output_path);
        
    elseif data_type == "3"
        % IMAGE DECRYPTION
        image_name = input('Enter the encrypted image filename (including extension): ', 's');
        input_path = fullfile('input_files', image_name);
        output_path = fullfile('input_files', ['decrypted_' image_name]);

        decrypt_func = str2func(['decrypt_image_week' num2str(week_number)]);
        decrypt_func(input_path, output_path);
    end
else
    disp('Invalid choice. Please select 1 or 2.');
end

% Remove folder from path to avoid conflicts
rmpath(week_folder);
