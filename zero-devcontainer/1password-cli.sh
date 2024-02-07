
OP_VERSION="v$(curl https://app-updates.agilebits.com/check/1/0/CLI2/en/2.0.0/N -s | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')"

ARCH=$(uname -m)
case $ARCH in
  x64) ARCH="x64" ;;
  x86_64) ARCH="x64" ;;
  aarch64) ARCH="arm64" ;;
  arm64) ARCH="arm64" ;;
  *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

mkdir -p /tmp/op
cd /tmp/op

echo "Downloading 1Password CLI $OP_VERSION for $ARCH..."
curl -sSfo op.zip https://cache.agilebits.com/dist/1P/op2/pkg/"$OP_VERSION"/op_linux_"$ARCH"_"$OP_VERSION".zip 
unzip -od /usr/local/bin/ op.zip 

rm op.zip