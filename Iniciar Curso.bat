@echo off
title Mestre dos Pensadores - Servidor Local
color 0A

echo.
echo  ================================================
echo   MESTRE DOS PENSADORES - Iniciando servidor...
echo  ================================================
echo.

:: Verifica se Python esta disponivel
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  ERRO: Python nao encontrado!
    echo  Por favor, instale o Python em https://python.org
    pause
    exit /b 1
)

:: Mata qualquer processo existente na porta 8000
for /f "tokens=5" %%a in ('netstat -ano 2^>nul ^| findstr ":8000 " ^| findstr "LISTENING"') do (
    taskkill /PID %%a /F >nul 2>&1
)

echo  Servidor iniciado com sucesso!
echo.
echo  Acesse o curso em:
echo.
echo    http://127.0.0.1:8000
echo.
echo  Abrindo o navegador automaticamente...
echo  (Mantenha esta janela aberta enquanto usa o curso)
echo.
echo  ================================================
echo   Pressione Ctrl+C para encerrar o servidor
echo  ================================================
echo.

:: Aguarda 1 segundo e abre o navegador automaticamente
timeout /t 1 /nobreak >nul
start "" "http://127.0.0.1:8000"

:: Inicia o servidor com caminho ABSOLUTO para a pasta do curso
python -m http.server 8000 --bind 127.0.0.1 --directory "c:\Users\kirya\Downloads\Historia"
