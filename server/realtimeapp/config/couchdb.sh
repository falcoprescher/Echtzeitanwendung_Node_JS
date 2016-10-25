#!/bin/sh

# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

COUCHDB_BIN_DIR=$(cd "${0%/*}" && pwd)
ERTS_BIN_DIR=$COUCHDB_BIN_DIR/../
cd "$COUCHDB_BIN_DIR/../"

export ROOTDIR=${ERTS_BIN_DIR%/*}

START_ERL=`cat "$ROOTDIR/releases/start_erl.data"`
ERTS_VSN=${START_ERL% *}
APP_VSN=${START_ERL#* }

export BINDIR="$ROOTDIR/erts-$ERTS_VSN/bin"
export EMU=beam
export PROGNAME=`echo $0 | sed 's/.*\///'`

exec "$BINDIR/erlexec" -boot "$ROOTDIR/releases/$APP_VSN/couchdb" \
     -args_file "$ROOTDIR/etc/vm.args" \
     -config "$ROOTDIR/releases/$APP_VSN/sys.config"