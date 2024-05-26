@ECHO OFF
DIR %windir%\system32\config\systemprofile >nul 2>nul
CLS
ECHO Verificando as permissoes de Administrador...   
net session >nul 2>&1
IF %errorLevel% == 0 (
   ECHO Sucesso: O programa foi executado como Administrador.
) ELSE (
   ECHO Falha: Feche o programa e execute como Administrador!
   PAUSE >nul
   EXIT
)

TITLE LOLBR OFFILINE CHAT
ECHO --------------------------------------------------------- 
ECHO -----------!                                !------------
ECHO -----------!   LOLBR OFFLINE CHAT - MENU    !------------ 
ECHO -----------!   __________________________   !------------
ECHO -----------!                                !------------
ECHO -----------!  1: Aparecer como invisivel    !------------ 
ECHO -----------!  2: Aparecer como disponivel   !------------ 
ECHO -----------!                                !------------
ECHO --------------------------------------------------------- 
ECHO -----------!                                !------------ 
ECHO -----------!    github.com/brunocarazato    !------------ 
ECHO -----------!    youtube.com/SenhorBizu      !------------ 
ECHO -----------!    instagram.com/senhorbizu    !------------ 
ECHO -----------!                                !------------ 
ECHO --------------------------------------------------------- 
SET /p "op=Digite o que deseja (1/2) ?: "

IF %op%==1 (
	netsh advfirewall firewall add rule name="LoL Chat" dir=out remoteip=172.65.212.1 protocol=TCP action=block
	netsh advfirewall firewall add rule name="LoL Chat" dir=out remoteip=2606:4700:90:0:4813:607d:9c17:5972 protocol=TCP action=block
	ECHO Sucesso! As regras foram adicionadas, agora voce estara jogando com o chat desativado. 
	ECHO Para ativar o chat novamente, execute o programa e escolha a opcao 2.
) ELSE IF %op%==2 (
	netsh advfirewall firewall delete rule name="LoL Chat"
	ECHO Sucesso! As regras foram removidas, agora voce estara jogando com o chat ativado. 
	ECHO Para desativar o chat novamente, execute o programa e escolha a opcao 1.
) ELSE (
	ECHO Valor invalido! Execute novamente o programa. Veja as opcoes no menu!
)

PAUSE