prename(){
  if [ "x$1" = x-v ]; then v=$1; shift; else v=; fi
  subst=$1; shift
  for arg
  do
    dest=$(printf "%s\n" "$arg" | sed "$subst") || return
    [ "$arg" != "$dest" ] && mv $v "$arg" "$dest"
  done
}
#example:
prename -v "s|[[]|\.|g" *
prename -v "s|[]]|\.|g" *
prename -v "s| |\.|g" *
prename -v "s|[)]||g" *
prename -v "s|[(]||g" *
prename -v "s|\.-\.|-|g" *
prename -v "s|\.\.|\.|g" *
