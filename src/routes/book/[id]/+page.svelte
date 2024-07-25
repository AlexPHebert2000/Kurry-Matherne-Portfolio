<script lang="ts">
  import type { PageData } from './$types';
  import BookCarouselCard from '../../../components/BookCarouselCard.svelte';
  export let data : PageData;
  let {book} = data;
</script>

<div>
  {#if book}
  <BookCarouselCard book={book}/>
  {/if}
</div>