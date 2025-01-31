function decrypt_image_week1(image_path, output_path)
    encrypted_img = imread(image_path); % Read encrypted image
    key = uint8(50); % Same XOR key used for encryption

    % Decrypt image using XOR operation
    decrypted_image = bitxor(encrypted_img, key);

    % Save decrypted image
    imwrite(decrypted_image, output_path);
    
    fprintf('Image decrypted and saved as: %s\n', output_path);
end
