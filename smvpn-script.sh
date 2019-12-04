sh /etc/vpnc/vpnc-script

case "$reason" in
	connect)
		echo 'Connected!'
		sudo sed -i '1s/^/nameserver 10.3.27.11\n/' /etc/resolv.conf
		sudo sed -i '1s/^/nameserver 10.3.27.12\n/' /etc/resolv.conf
		# sudo sed -i '1s/^/nameserver 10.224.0.18\n/' /etc/resolv.conf
		;;
esac

exit 0
