#! /bin/sh




for x in $(pythonz list | perl -p -e "s/(?:^#[\s\S]*$|[ ]+)//g");do
    virtualenv -p ~/.pythonz/pythons/${x}/bin/python ~/.pythonz/ENV/${x}
done;

exit 0;
