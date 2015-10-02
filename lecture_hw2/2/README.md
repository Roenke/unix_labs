#### HOWTO Создать кастомный элемент меню в GRUB, который позволить загрузить ОС с различными ядрами (или конфигурациями).

* Открыть файл `/etc/grub.d/40_custom`. Дописать ему в конец следующие строки(возможно заменив скрипт илициализации и файлы ядра):
```
submenu 'Your submenu name' {
	menuentry 'Your menuentry name' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-3.19.0-30-generic-advanced-4e538d35-c867-4fc0-ade9-8172e47665bd' {
		recordfail
		load_video
		gfxmode $linux_gfx_mode
		insmod gzio
		insmod part_msdos
		insmod ext2
		set root='hd0,msdos1'
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root --hint-bios=hd0,msdos1 --hint-efi=hd0,msdos1 --hint-baremetal=ahci0,msdos1  4e538d35-c867-4fc0-ade9-8172e47665bd
		else
		  search --no-floppy --fs-uuid --set=root 4e538d35-c867-4fc0-ade9-8172e47665bd
		fi
		echo	'Loading Linux 3.19.0-30-generic ...'
		linux	/boot/vmlinuz-3.19.0-30-generic root=UUID=4e538d35-c867-4fc0-ade9-8172e47665bd ro  quiet splash $vt_handoff
		echo	'Loading initial ramdisk ...'
		initrd	/boot/initrd.img-3.19.0-30-generic
	}
}
```
Примеры подобной конструкции можно найти в файле `/boot/grub/grub.cfg` 

* Выполнить команду `sudo update-grub`. Перезагрузиться.

P.S. Может оказаться, что меню GRUB'a при запуске не появится. Скорее всего, это означает, что показ меню GRUB при запуске отключен.

Чтобы его включить, нужно открыть файл `/etc/default/grub` и закомментировать строчку `GRUB_HIDDEN_TIMEOUT=0 -> # GRUB_HIDDEN_TIMEOUT=0`

