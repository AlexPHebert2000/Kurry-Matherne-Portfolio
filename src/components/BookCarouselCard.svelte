<script lang="ts">
	import type { WorkWithImages } from '../../types';
	export let book: WorkWithImages;
</script>

<div class="bg-slate-400 rounded-md p-2 my-3 flex-1">
	<div class="flex flex-row">
		<img class="w-40" src={book.images[0].url} alt={book.title} />
		<div class="ml-2">
			<h1>{book.title}</h1>
			{#if book.description}
				<p>{book.description}</p>
			{/if}
		</div>
	</div>
	<a href={`/book/${book.id}`}>See More</a>
</div>
