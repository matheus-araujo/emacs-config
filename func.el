;;C++ compile for Q++
(defun my-cpp-compile-quantum ()
  "Compila o arquivo C++ ."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (compile
         (read-string "Compile: "
                      (format "g++ -pedantic -std=c++17 -Wall -Wextra -Weffc++ -fopenmp \
                               -O3 -DNDEBUG -DEIGEN_NO_DEBUG \
                               -isystem $HOME/programmingpp/eigen-3.4.0/ \
                               -I $HOME/programmingpp/qpp-main/include \
                               -I $HOME/programmingpp/qpp-main/qasmtools/include \
                               %s -o %s.out"
			      filename
			      (file-name-sans-extension filename)))) 
      (message "Nenhum arquivo associado ao buffer atual!"))))
(provide 'my-cpp-compile-quantum)
(global-set-key (kbd "C-c q") 'my-cpp-compile-quantum)

;;C++ compile
(defun my-cpp-compile ()
  "Compila o arquivo C++."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (compile
         (read-string "Compile: "
                      (format "g++ -pedantic -std=c++17 %s -o %s.out"
			      filename
			      (file-name-sans-extension filename)))) 
      (message "Nenhum arquivo associado ao buffer atual!"))))

(global-set-key (kbd "C-c c c") 'my-cpp-compile)

(defun my-c-compile ()
  "Compila o arquivo C ."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (compile
         (read-string "Compile: "
                      (format "gcc %s -o %s.out"
			      filename
			      (file-name-sans-extension filename)))) 
      (message "Nenhum arquivo associado ao buffer atual!"))))

(global-set-key (kbd "C-c c") 'mmy-c-compile)

(provide 'my-cpp-compile-quantum)
(provide 'my-cpp-compile)
(provide 'my-c-compile)
(provide 'func )
