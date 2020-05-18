how to check if directory/file exist using c/c++

struct stat st;
if(stat("/tmp",&st) == 0)
        printf(" /tmp is present\n");

remove file:

remove();