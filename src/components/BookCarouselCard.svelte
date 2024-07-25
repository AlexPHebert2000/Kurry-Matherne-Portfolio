<script lang="ts">
    import type { Book } from "@prisma/client"
    export let book : Book;
</script>

<div class="bg-slate-400 rounded-md p-2 my-3 w-96">
    <div class="flex flex-row">
        <img class="w-40" src={book.coverImage} alt={book.title}/>
        <div class="ml-2">
            <h1>{book.title}</h1>
            <p>{book.description}</p>
        </div>
    </div>
    <a href={`/book/${book.id}`}>See More</a>
</div>