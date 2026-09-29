@echo off
setlocal
cd /d "%~dp0"
if not exist ".git\" goto wrongfolder
if not exist "CNAME" goto wrongfolder
if not exist "courses\" goto wrongfolder

if exist "courses\heat-transfer\" rmdir /s /q "courses\heat-transfer"

for %%D in (fluid-mechanics thermodynamics numerical-methods me320 me420 me521 micro-scale-heat-transfer) do (
  if exist "courses\%%D\SOURCE_AND_RIGHTS.txt" del /q "courses\%%D\SOURCE_AND_RIGHTS.txt"
)

if exist "courses\fluid-mechanics\materials\Kaynak_ve_Lisans\KAYNAK_VE_DEGISIKLIKLER.txt" del /q "courses\fluid-mechanics\materials\Kaynak_ve_Lisans\KAYNAK_VE_DEGISIKLIKLER.txt"
for %%D in (me320 me420 me521) do (
  if exist "courses\%%D\materials\Kaynak_ve_Lisans\KAYNAK_VE_KULLANIM.txt" del /q "courses\%%D\materials\Kaynak_ve_Lisans\KAYNAK_VE_KULLANIM.txt"
)
for %%F in (KAYNAK_VE_LISANS.txt Numerical_Fluid_Mechanics_Ders_Uygulamalari_KAYNAK_VE_LISANS.txt Numerical_Fluid_Mechanics_MATLAB_Dosyalari_KAYNAK_VE_LISANS.txt) do (
  if exist "courses\numerical-methods\materials\Kaynak_ve_Lisans\%%F" del /q "courses\numerical-methods\materials\Kaynak_ve_Lisans\%%F"
)

echo Eski kaynak TXT dosyalari ve tekrar eden isi gecisi klasoru temizlendi.
echo MATLAB kodu iceren TXT dosyalari korundu.
echo Bu pencereyi kapatin, sonra bu CMD dosyasini silin.
pause
exit /b 0

:wrongfolder
echo Bu dosyayi GitHub depo klasorune koyup oradan calistirin.
echo Beklenen klasorde .git, CNAME ve courses bulunmadi.
pause
exit /b 1
