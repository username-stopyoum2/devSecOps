#!/bin/bash

systemctl_base () {

	systemctl start ${*}
	systemctl enable ${*}
	systemctl is-enabled ${*} 1>/dev/null || systemctl enable ${*} && systemctl status ${*}
}

systemctl_base ${*}
