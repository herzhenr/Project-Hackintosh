mkdir ~/Certs

sudo cp /boot/efi/EFI/ubuntu/shimx64.efi ~/Certs/
cp OPENCORE_FOLDER/Utilities/ShimToCert/shim-to-cert.tool ~/Certs/

cd ~/Certs/
chmod +X shim-to-cert.tool
sudo ./shim-to-cert.tool shimx64.efi

# Secure Boot block list found and saved as vendor.dbx.
# Certificate extracted as CanonicalLtd.MasterCertificateAuthority.pem.

sudo apt install efitools
cert-to-efi-sig-list CanonicalLtd.MasterCertificateAuthority.pem UbuntuOpenCoreKey.esl