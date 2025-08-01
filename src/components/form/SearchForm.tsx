import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { type FormEvent } from 'react';
import { useState } from 'react';
import { useToast } from '@/hooks/use-toast';
import { Search } from 'lucide-react'; // ✅ أيقونة البحث

type SearchFormProps = {
  userName: string;
  setUserName: React.Dispatch<React.SetStateAction<string>>;
};

const SearchForm = ({ userName, setUserName }: SearchFormProps) => {
  const { toast } = useToast();
  const [text, setText] = useState(userName);

  const handleSearch = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    if (text.trim() === '') {
      toast({
        description: 'Please enter a valid username',
        variant: 'destructive',
      });
      return;
    }
    setUserName(text.trim());
  };

  return (
    <div className="flex justify-center w-full mb-8">
      <form
        onSubmit={handleSearch}
        className="flex items-center gap-2 w-full max-w-lg p-2 rounded-2xl bg-gradient-to-r from-indigo-500/20 via-purple-500/20 to-pink-500/20 shadow-lg border border-indigo-500/30"
      >
        <Label htmlFor="search" className="sr-only">
          Search
        </Label>

        <div className="flex items-center pl-3">
          <Search className="text-indigo-500 w-5 h-5" />
        </div>

        <Input
          type="text"
          id="search"
          value={text}
          onChange={(e) => setText(e.target.value)}
          placeholder="Search GitHub users..."
          className="flex-grow bg-transparent border-none focus:ring-0 text-white placeholder:text-gray-400"
        />

        <Button
          type="submit"
          className="bg-gradient-to-r from-indigo-500 to-purple-500 hover:from-purple-500 hover:to-pink-500 text-white font-semibold shadow-md hover:shadow-lg transition-all duration-300"
        >
          Search
        </Button>
      </form>
    </div>
  );
};

export default SearchForm;
