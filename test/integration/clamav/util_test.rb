# clamav-client - ClamAV client
# Copyright (C) 2014 Franck Verrot <franck@verrot.fr>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'test_helper'
describe "ClamAV::Client Integration Tests" do
  describe "Util" do
    describe "absolute_path" do
      it "transforms a single file to an array of one element" do
        expected_path = File.absolute_path(__FILE__)
        actual_path   = ClamAV::Util.path_to_files(__FILE__).first
        assert_equal expected_path, actual_path
      end

      it "transforms a directory to an array of N element" do
        files = %w(
          clamav-client/test/integration/clamav/client_test.rb
          clamav-client/test/integration/clamav/util_test.rb
        ).sort
        actual_files = ClamAV::Util.path_to_files(File.dirname(__FILE__)).sort

        files.each_with_index do |file, index|
          path   = Regexp.new(".*/#{file}")
          assert path.match(actual_files[index])
        end
      end
    end
  end
end
