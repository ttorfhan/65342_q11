Result=20
Correct_point=10
Wrong_point=7
NotGCC_point=5
for file in L*.c
do
    if [ -f "$file" ]
    then
        program_name=$(echo "$file" | cut -d '.' -f 1)
        if gcc "$file" -o "$program_name" > /dev/null 2>&1
        then
            answer=$(./"$program_name")
            if [ "$answer" -eq "$Result" ]
            then
            printf "%s \t %s\n" "$program_name" "$Correct_point"
            else
            printf "%s \t %s\n " "$program_name" "$Wrong_point"
            fi
        else
            printf "%s \t %s\n" "$program_name" "$NotGCC_point"
        fi
    fi
done
exit 0