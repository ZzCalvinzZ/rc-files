sh /etc/vpnc/vpnc-script

case "$reason" in
	connect)
		sudo sed -i '1s/^/nameserver 10.224.0.18\n/' /etc/resolv.conf
		;;
esac

exit 0
