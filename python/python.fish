function _python_modules
  echo '
import pkgutil
import sys

# walk_packages() is much slower than iter_modules(), use it only when
# completing something with a dot in it.
if len(sys.argv) > 1 and "." in sys.argv[1]:
    walker = pkgutil.walk_packages
else:
    walker = pkgutil.iter_modules

for mod in walker():
    print(mod[1])
  ' | command python -
end
